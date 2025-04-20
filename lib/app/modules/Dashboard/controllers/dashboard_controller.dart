import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trady/app/modules/Home/views/home_view.dart';
import 'package:trady/app/modules/MyBookings/views/my_bookings_view.dart';
import 'package:trady/app/modules/Setting/views/setting_view.dart';

class DashboardController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final NotchBottomBarController notchBottomBarController =
      NotchBottomBarController(index: 0);
  int maxCount = 3;
  int counter = 0;
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  final List<Widget> screens = [
    const HomeView(),
    const MyBookingsView(),
    const SettingView()
  ];
  void onTabSelected(int index) {
    log('current selected index $index');
    pageController.jumpToPage(index);
  }

  Future<bool> handleBackPress() async {
    counter += 1;
    if (counter == 1) {
      EasyLoading.showToast('Press two times to Exit'.tr);
      Future.delayed(const Duration(seconds: 1), () {
        counter = 0;
      });
    }
    return counter >= 2;
  }
}
