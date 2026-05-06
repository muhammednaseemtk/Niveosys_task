import 'package:flutter/material.dart';
import 'package:niveosys/features/auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (context, controller, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,

            title: const Text(
              AppStrings.dashboard,
              style: TextStyle(color: Colors.white),
            ),

            actions: [
              IconButton(
                onPressed: () {
                  controller.logout(context);
                },

                icon: const Icon(Icons.logout, color: Colors.white),
              ),
            ],
          ),

          body: const Center(
            child: Text("Welcome to Dashboard", style: TextStyle(fontSize: 22)),
          ),
        );
      },
    );
  }
}
