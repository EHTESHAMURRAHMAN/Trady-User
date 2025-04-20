import 'package:get/get.dart';
import 'package:trady/AppController.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<AppController>(AppController(), permanent: true);
  }
}
