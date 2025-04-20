import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trady/app/Api/Api_Import.dart';
import 'package:trady/app/Api/Base_Api.dart';
import 'package:trady/app/Model/Category_List.dart';

class HomeController extends GetxController {
  final categoryItem = RxList<CategoryItem>();
  ApiImport apiImpl = ApiImport();
  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  Future<void> getCategorys() async {
    ApiResponse apiResponse = await apiImpl.getCategoryApi();
    if (apiResponse.status) {
      CategoryResponse response = apiResponse.data;
      categoryItem.value = response.data;
      EasyLoading.showToast(response.message);
    } else {
      EasyLoading.showToast(apiResponse.message.toString());
    }
  }
}
