import 'package:flutter/material.dart';
import 'package:niveosys/features/auth/controller/auth_controller.dart';
import 'package:niveosys/features/auth/view/login_screen.dart';
import 'package:niveosys/features/dashboard/view/dashboard_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final controller = context.read<AuthController>();

    final isLoggedIn = await controller.autoLogin();

    if (!mounted) return;

    if (isLoggedIn) {
      controller.startSessionTimer(context);

      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
