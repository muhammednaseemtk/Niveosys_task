import 'package:flutter/material.dart';
import 'package:niveosys/features/auth/view/login_screen.dart';
import 'package:niveosys/features/dashboard/view/dashboard_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case '/dashboard':
        return MaterialPageRoute(builder: (_) =>  DashboardScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
