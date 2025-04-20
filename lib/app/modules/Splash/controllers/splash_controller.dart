import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:trady/app/Api/Base_Api.dart';
import 'package:trady/app/Model/Profile_response.dart';

import '../../../Data/storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final prefs = Get.find<SharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    _launchApp();
  }

  void _launchApp() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLogin = prefs.getBool(StorageConstants.isLogin) ?? false;

    String? storedData = prefs.getString(StorageConstants.userInfo);

    if (storedData == null || storedData.isEmpty) {
      Get.offAllNamed(Routes.ONBOARD);
      return;
    }

    try {
      List<ProfileData> users = List<ProfileData>.from(
        jsonDecode(storedData).map((x) => ProfileData.fromJson(x)),
      );

      if (users.isNotEmpty) {
        ProfileData activeUser = users.first;
        userInfo = activeUser;
      }

      if (isLogin) {
        Get.offAllNamed(Routes.DASHBOARD);
        return;
      }
    } catch (e) {
      print("Error parsing user data: $e");
      Get.offAllNamed(Routes.ONBOARD);
    }
  }
}
