import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/services/session_service.dart';
import '../../../core/services/storage_service.dart';
import '../service/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService authService = AuthService();

  bool isLoading = false;

  Timer? timer;

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;

      notifyListeners();

      final response = await authService.login(
        email: email,
        password: password,
      );

      await StorageService.saveToken(response.token);

      if (!context.mounted) return;

      startSessionTimer(context);

      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  Future<bool> autoLogin() async {
    final token = await StorageService.getToken();

    if (token == null) {
      return false;
    }

    final valid = await SessionService.isSessionValid();

    return valid;
  }

  void startSessionTimer(BuildContext context) {
    timer?.cancel();

    timer = Timer(const Duration(minutes: 5), () async {
      await logout(context);
    });
  }

  Future<void> logout(BuildContext context) async {
    timer?.cancel();

    await StorageService.clearStorage();

    if (!context.mounted) return;

    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }
}
