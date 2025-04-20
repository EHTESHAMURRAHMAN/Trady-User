import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        color: const Color(0xff8532B7),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey Tradey",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              "Panyi and Thompson Ltd.",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }
}
