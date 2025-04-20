import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trady/app/Model/Category_List.dart';
import 'package:trady/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8532B7),
      appBar: AppBar(
          backgroundColor: const Color(0xff8532B7),
          elevation: 0,
          title: const Text('Trady',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17)),
          centerTitle: false,
          actions: const [
            Icon(Icons.notifications, color: Colors.yellow),
            SizedBox(width: 16),
            Icon(Icons.account_circle, color: Colors.yellow),
            SizedBox(width: 16)
          ]),
      body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text("What are you looking for today?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFEADAFD),
                    hintText: "Select a service",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Services",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.white)
                    ]),
                const SizedBox(height: 12),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.categoryItem.length,
                      itemBuilder: (context, index) {
                        CategoryItem model = controller.categoryItem[index];
                        return Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                image: DecorationImage(
                                    image: NetworkImage(model.img),
                                    fit: BoxFit.cover)),
                            child: Stack(children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      color: Colors.black.withOpacity(0.4))),
                              Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(model.title,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 8),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.yellow,
                                              foregroundColor: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8)),
                                          onPressed: () {
                                            Get.toNamed(Routes.VENDOR_LIST,
                                                arguments: {
                                                  "categoryID": model.id,
                                                  "categoryName": model.title
                                                });
                                          },
                                          child: const Text("Book Now"),
                                        )
                                      ]))
                            ]));
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
