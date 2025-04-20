import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../Api/Api_Import.dart';
import '../../../Api/Base_Api.dart';
import '../../MyBookings/controllers/my_bookings_controller.dart';

class BookvendorsController extends GetxController {
  final booking = Get.isRegistered()
      ? Get.find<MyBookingsController>()
      : Get.put(MyBookingsController());

  //   final vendor = RxList<Vendor>();
  // final isVendor = false.obs;
  ApiImport apiImpl = ApiImport();
  final argument = Get.arguments;
  final vendorID = 0.obs;
  var name = ''.obs;
  var addressLine1 = ''.obs;
  var townCity = ''.obs;
  var postalCode = ''.obs;
  var phone = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    if (argument != null) {
      vendorID.value = argument['vendorID'];
      //  await getVendorList();
    }
  }

  var selectedDate = DateTime.now().obs;

  void setDate(DateTime date) {
    selectedDate.value = date;
  }

  void bookVendor() async {
    Map body = {
      "id": userInfo?.id,
      "vender_id": vendorID.value,
      "user_name": name.value,
      "user_address":
          "${addressLine1.value}, ${townCity.value}, ${postalCode.value}",
      "user_phone": phone.value,
      "booking_date": selectedDate.value.toIso8601String(),
    };

    ApiResponse apiResponse = await apiImpl.bookVendorApi(body);
    if (apiResponse.status) {
      EasyLoading.showToast("Booking Successful");
      booking.myBookingList();
      Get.back();
    } else {
      EasyLoading.showToast("Booking Failed: ${apiResponse.message}");
    }
  }
}
