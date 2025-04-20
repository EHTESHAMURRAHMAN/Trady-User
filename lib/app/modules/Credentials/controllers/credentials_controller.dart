import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trady/app/Api/Api_Import.dart';
import 'package:trady/app/Api/Base_Api.dart';
import 'package:trady/app/Data/storage.dart';
import 'package:trady/app/routes/app_pages.dart';

import '../../../Model/AuthResp.dart';
import '../../../Model/Profile_response.dart';

class CredentialsController extends GetxController {
  final prefs = Get.find<SharedPreferences>();

  final profileData = Rxn<ProfileData>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final error = ''.obs;
  ApiImport apiImport = ApiImport();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void signIUp() async {
    Map body = {"email": emailController.text, "pass": passwordController.text};
    ApiResponse apiResponse = await apiImport.signUpApi(body);
    if (apiResponse.status) {
      AuthResp response = apiResponse.data;
      EasyLoading.showToast(response.message);
    } else {
      EasyLoading.showToast(apiResponse.message.toString());
    }
  }

  void signIn() async {
    Map body = {
      "email": emailController.text,
      "pass": passwordController.text,
    };
    ApiResponse apiResponse = await apiImport.signInApi(body);
    if (apiResponse.status) {
      AuthResp response = apiResponse.data;

      EasyLoading.showToast(response.message);
      getProfile(response.data.id);
    } else {
      EasyLoading.showToast(apiResponse.message.toString());
    }
  }

  Future<void> getProfile(id) async {
    ApiResponse apiResponse = await apiImport.getProfileApi(id);
    if (apiResponse.status) {
      prefs.setBool(StorageConstants.isLogin, true);
      ProfileResp response = apiResponse.data;
      profileData.value = response.data;
      EasyLoading.showToast(response.message);
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      EasyLoading.showToast(apiResponse.message.toString());
    }
  }
}
