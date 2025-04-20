import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trady/app/routes/app_pages.dart';

class OnboardController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  final onboardingData = [
    {
      "image": "assets/icons/customer-1.png",
      "title": "Welcome to our App!",
      "desc": "Easily schedule professional on-demand home services"
    },
    {
      "image": "assets/icons/customer-2.png",
      "title": "Find the Right Contractor for your project",
      "desc":
          "Browse and compare quotes from vetted professionals, read reviews to make an informed decision"
    },
    {
      "image": "assets/icons/customer-3.png",
      "title": "Keep track of the project",
      "desc":
          "Track progress, communicate and rate your contractor in real-time, all through our app"
    }
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value == onboardingData.length - 1) {
      // Navigate to login or home
      Get.offNamed(Routes.CREDENTIALS);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
