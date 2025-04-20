import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => controller.handleBackPress(),
        child: Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(controller.screens.length,
                (index) => controller.screens[index]),
          ),
          extendBody: true,
          bottomNavigationBar: (controller.screens.length <=
                  controller.maxCount)
              ? AnimatedNotchBottomBar(
                  notchBottomBarController: controller.notchBottomBarController,
                  color: const Color(0xFF6A1B9A), // Deep Purple background
                  showLabel: true,
                  textOverflow: TextOverflow.visible,
                  maxLine: 1,
                  shadowElevation: 5,
                  kBottomRadius: 20.0,
                  notchColor: const Color(0xFFAB47BC), // Lighter purple notch
                  removeMargins: false,
                  bottomBarWidth: 500,
                  showShadow: true,
                  durationInMilliSeconds: 300,
                  itemLabelStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  elevation: 1,
                  kIconSize: 24.0,
                  bottomBarItems: [
                    BottomBarItem(
                        inActiveItem:
                            const Icon(Icons.home, color: Colors.white54),
                        activeItem: const Icon(Icons.home, color: Colors.white),
                        itemLabelWidget: Text('Home'.tr,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white))),
                    BottomBarItem(
                        inActiveItem: const Icon(Icons.book_online,
                            color: Colors.white54),
                        activeItem:
                            const Icon(Icons.book_online, color: Colors.white),
                        itemLabelWidget: Text('Booking'.tr,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white))),
                    BottomBarItem(
                        inActiveItem: const Icon(CupertinoIcons.gear_alt,
                            color: Colors.white54),
                        activeItem: const Icon(CupertinoIcons.gear_alt_fill,
                            color: Colors.white),
                        itemLabelWidget: Text('Setting'.tr,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white)))
                  ],
                  onTap: (index) {
                    controller.onTabSelected(index);
                  },
                )
              : null,
        ));
  }
}
