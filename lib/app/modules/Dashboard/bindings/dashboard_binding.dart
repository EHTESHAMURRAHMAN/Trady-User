import 'package:get/get.dart';
import 'package:trady/app/modules/Home/controllers/home_controller.dart';
import 'package:trady/app/modules/MyBookings/controllers/my_bookings_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
    Get.put<HomeController>(HomeController());
    Get.put<MyBookingsController>(MyBookingsController());
  }
}
