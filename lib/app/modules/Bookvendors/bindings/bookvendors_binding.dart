import 'package:get/get.dart';

import '../controllers/bookvendors_controller.dart';

class BookvendorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookvendorsController>(BookvendorsController());
  }
}
