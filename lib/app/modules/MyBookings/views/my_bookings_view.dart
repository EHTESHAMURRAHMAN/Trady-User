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
                  color: Colors.black))),
      body: RefreshIndicator(
        onRefresh: () => controller.myBookingList(),
        child: Obx(() {
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
                                    _statusBadge(trader.bookingstatus)
                                  ],
                                ),
                                const SizedBox(height: 10),
                                _infoRow("Category", trader.categoryname),
                                _infoRow("Username", trader.userName),
                                _infoRow("Address:", trader.userAddress),
                                _infoRow("Phone", trader.userPhone),
                                _infoRow("From Date:", trader.bookingDate),
                                _infoRow("To Date:", trader.bookingDate),
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
      ),
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

  Widget _statusBadge(int status) {
    Color color;
    String label;

    switch (status) {
      case 0:
        color = Colors.amber.shade200;
        label = 'Pending';
        break;
      case 1:
        color = Colors.green.shade200;
        label = 'Booked';
        break;
      case 2:
        color = Colors.red.shade200;
        label = 'Declined';
        break;
      default:
        color = Colors.grey;
        label = 'Unknown';
    }

    return Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child:
            Text(label, style: const TextStyle(fontWeight: FontWeight.w400)));
  }
}
