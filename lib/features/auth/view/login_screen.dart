import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/validators.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Consumer<AuthController>(
            builder: (context, controller, child) {
              return Form(
                key: formKey,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      AppStrings.login,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    TextFormField(
                      controller: emailController,

                      validator: Validators.emailValidator,

                      decoration: InputDecoration(
                        hintText: AppStrings.email,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      controller: passwordController,

                      obscureText: true,

                      validator: Validators.passwordValidator,

                      decoration: InputDecoration(
                        hintText: AppStrings.password,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,

                      height: 55,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),

                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.login(
                              email: emailController.text.trim(),

                              password: passwordController.text.trim(),

                              context: context,
                            );
                          }
                        },

                        child: controller.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                AppStrings.login,
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
