import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String tokenKey = "token";
  static const String loginTimeKey = "login_time";

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(tokenKey, token);

    await prefs.setInt(loginTimeKey, DateTime.now().millisecondsSinceEpoch);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(tokenKey);
  }

  static Future<int?> getLoginTime() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(loginTimeKey);
  }

  static Future<void> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
