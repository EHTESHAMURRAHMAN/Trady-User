import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/bookvendors_controller.dart';

class BookvendorsView extends GetView<BookvendorsController> {
  const BookvendorsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADAFD),
      appBar: AppBar(
        title: const Text("Confirm date and address",
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Container(
                  color: Colors.white,
                  child: TableCalendar(
                    focusedDay: controller.selectedDate.value,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) =>
                        isSameDay(controller.selectedDate.value, day),
                    onDaySelected: (selectedDay, _) {
                      controller.setDate(selectedDay);
                    },
                  ),
                )),
            const SizedBox(height: 16),
            Obx(() => Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Confirmed Date: ${controller.selectedDate.value.toLocal().toString().split(' ')[0]}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            const SizedBox(height: 24),
            const Text("Confirm Appointment Address",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildTextField(
                "Enter Name", "David", (val) => controller.name.value = val),
            _buildTextField("Address Line 1", "Ex. XYZ Street",
                (val) => controller.addressLine1.value = val),
            _buildTextField("Town/City", "Ex. Tambury",
                (val) => controller.townCity.value = val),
            _buildTextField("Postal Code", "Ex. MK40",
                (val) => controller.postalCode.value = val),
            _buildTextField(
                "Phone", "Ex. 22335566", (val) => controller.phone.value = val,
                keyboardType: TextInputType.phone),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.bookVendor();
                print("Date: ${controller.selectedDate.value}");
                print("Address 1: ${controller.addressLine1.value}");
                print("City: ${controller.townCity.value}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Complete Booking",
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, Function(String) onChanged,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
