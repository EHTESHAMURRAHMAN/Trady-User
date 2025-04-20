import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trady/app/Api/Api_Import.dart';
import 'package:trady/app/Api/Base_Api.dart';
import 'package:trady/app/Model/MyBooking_Resp.dart';

class MyBookingsController extends GetxController {
  final myBooking = RxList<MyBooking>();
  final ismyBooking = false.obs;
  ApiImport apiImpl = ApiImport();

  @override
  void onInit() async {
    super.onInit();
    await myBookingList();
  }

  Future<void> myBookingList() async {
    ismyBooking.value = false;
    ApiResponse apiResponse = await apiImpl.myBookingApi(userInfo?.id ?? 0);
    if (apiResponse.status) {
      MyBookingResponse response = apiResponse.data;
      myBooking.value = response.data;
      ismyBooking.value = true;
    } else {
      EasyLoading.showToast(apiResponse.message.toString());
    }
  }
}
