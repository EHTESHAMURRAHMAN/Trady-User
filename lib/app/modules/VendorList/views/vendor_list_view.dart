import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/vendor_list_controller.dart';

class VendorListView extends GetView<VendorListController> {
  const VendorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADAFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(() => Text(
            '${controller.vendor.length} Traders found for "${controller.categoryName.value}"',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black))),
      ),
      body: Obx(() {
        return !controller.isVendor.value
            ? const Center(child: CircularProgressIndicator())
            : controller.vendor.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.vendor.length,
                    itemBuilder: (context, index) {
                      final trader = controller.vendor[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 4),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset('assets/icons/workericon.png',
                                height: 40),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(trader.vendorName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16)),
                                Text(trader.address,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                Text(trader.venderId,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                                const Icon(Icons.arrow_forward,
                                    color: Colors.transparent),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.arrow_forward,
                                    color: Colors.transparent),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      Get.toNamed(Routes.BOOKVENDORS,
                                          arguments: {"vendorID": trader.id});
                                    },
                                    icon: const Icon(Icons.arrow_forward,
                                        color: Colors.black),
                                    label: const Text("Book Now",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No Booking Found",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
      }),
    );
  }
}
