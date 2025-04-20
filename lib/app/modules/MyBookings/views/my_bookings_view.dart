import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_bookings_controller.dart';

class MyBookingsView extends GetView<MyBookingsController> {
  const MyBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADAFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Bookings',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: Obx(() {
        return !controller.ismyBooking.value
            ? const Center(child: CircularProgressIndicator())
            : controller.myBooking.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.myBooking.length,
                    itemBuilder: (context, index) {
                      final trader = controller.myBooking[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 4),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/workericon.png',
                                      height: 50),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      trader.venderName,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              _infoRow("Username", trader.userName),
                              _infoRow("Address:", trader.userAddress),
                              _infoRow("Phone", trader.userPhone),
                              _infoRow("Booking Date:", trader.bookingDate),
                            ],
                          ),
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

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title ",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Expanded(
            child: Text(value,
                style: const TextStyle(fontSize: 14, color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}
