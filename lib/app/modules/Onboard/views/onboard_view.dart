import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: controller.onboardingData.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image.asset(
                      controller.onboardingData[index]["image"]!,
                      height: 250,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      controller.onboardingData[index]["title"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        controller.onboardingData[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
          ),
          Obx(() => SizedBox(
                height: 50,
                width: controller.currentPage.value ==
                        controller.onboardingData.length - 1
                    ? 200
                    : 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.purple.shade700),
                    onPressed: controller.nextPage,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text(
                        controller.currentPage.value ==
                                controller.onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(Icons.arrow_forward,
                          color: Colors.white, size: 18),
                    ])),
              )),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
