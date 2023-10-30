import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/loader.dart';
import 'package:medical_care_app/components/medicine_container.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/controller/medicine_controller.dart';
import 'package:medical_care_app/views/medicine_info_view.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({super.key});

  static const String viewRouteName = "/PhamacyView";

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 230,
                  padding: const EdgeInsets.only(right: 8.0),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    border: Border(
                      bottom: BorderSide(width: 2),
                      left: BorderSide(width: 0),
                      right: BorderSide(width: 2),
                      top: BorderSide(width: 2),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/img/pharmacy.png'),
                      const Text(
                        "Pharmacy",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: Image.asset('assets/img/app_logo.png'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Hello, How can we help?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: GetBuilder<MedicineController>(
              init: MedicineController(),
              builder: (controller) => TextField(
                decoration: const InputDecoration(
                  hintText: "Search...",
                  fillColor: Colors.white,
                  // focusColor: Colors.white,
                  filled: true,
                ),
                controller: controller.searchController,
                onChanged: (value) => controller.search(),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<MedicineController>(
              builder: (controller) => (controller.isSearching)
                  ? ListView(
                      children: List.generate(
                        controller.searchMedicines.length,
                        (index) => MedicineContainer(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          text: controller.searchMedicines[index].name,
                          ontap: () {
                            Get.toNamed(
                              MedicineInfoView.viewRouteName,
                              arguments:
                                  controller.searchMedicines[index].toViewMap(),
                            );
                          },
                        ),
                      ),
                    )
                  : (controller.dataIsReady)
                      ? ListView(
                          children: List.generate(
                            controller.medicines.length,
                            (index) => MedicineContainer(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              text: controller.getName(index),
                              ontap: () {
                                Get.toNamed(
                                  MedicineInfoView.viewRouteName,
                                  arguments:
                                      controller.getMedicine(index).toViewMap(),
                                );
                              },
                            ),
                          ),
                        )
                      : const Loader(),
            ),
          ),
        ],
      ),
    );
  }
}
