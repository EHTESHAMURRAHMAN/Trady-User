import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trady/app/Api/Api_Import.dart';
import 'package:trady/app/Model/Vendor_Resp.dart';

import '../../../Api/Base_Api.dart';

class VendorListController extends GetxController {
  final vendor = RxList<Vendor>();
  final isVendor = false.obs;
  ApiImport apiImpl = ApiImport();
  final argument = Get.arguments;
  final categoryID = 0.obs;
  final categoryName = "".obs;
  @override
  void onInit() async {
    super.onInit();
    if (argument != null) {
      categoryID.value = argument['categoryID'];
      categoryName.value = argument['categoryName'];
      await getVendorList();
    }
  }

  Future<void> getVendorList() async {
    isVendor.value = false;
    ApiResponse apiResponse = await apiImpl.getVendorListApi(categoryID.value);
    if (apiResponse.status) {
      VendorResponse response = apiResponse.data;
      vendor.value = response.data;
      isVendor.value = true;
    } else {
      EasyLoading.showToast(apiResponse.message.toString());
    }
  }
}
