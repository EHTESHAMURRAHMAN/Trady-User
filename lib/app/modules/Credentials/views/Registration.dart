import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trady/app/routes/app_pages.dart';
import '../controllers/credentials_controller.dart';

class RegisterView extends StatelessWidget {
  final CredentialsController authController = Get.find();
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                color: const Color(0xff8532B7),
                child: const Column(children: [
                  Text("Hey Tradey",
                      style: TextStyle(fontSize: 28, color: Colors.white)),
                  Text("Panyi and Thompson Ltd.",
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ]),
              ),
              const SizedBox(height: 40),
              const Text(
                "Register",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Create your account to get started",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.CREDENTIALS),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Form(
                key: _signUpFormKey,
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purple.shade700, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextFormField(
                      controller: authController.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purple.shade700, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Confirm Password
                    TextFormField(
                      controller: authController.confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purple.shade700, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != authController.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Register Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.amber.shade200,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            authController.signIUp();
                          }
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Error Message
                    Obx(() => Text(
                          authController.error.value,
                          style: const TextStyle(color: Colors.red),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
