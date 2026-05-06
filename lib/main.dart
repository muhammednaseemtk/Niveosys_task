import 'package:flutter/material.dart';
import 'package:niveosys/core/routes/app_routes.dart';
import 'package:niveosys/features/dashboard/view/dashboard_screen.dart';
import 'package:niveosys/features/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'features/auth/controller/auth_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthController(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: AppRoutes.generateRoute,

        home: SplashScreen(),
      ),
    );
  }
}
