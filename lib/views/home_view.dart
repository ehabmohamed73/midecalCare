import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/controller/user_controller.dart';
import 'package:medical_care_app/views/doctor_view.dart';
import 'package:medical_care_app/views/medicine_dose_view.dart';
import 'package:medical_care_app/views/pharmacy_view.dart';
import 'package:medical_care_app/views/welcome_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const String viewRouteName = "/HomeView";

  gotoWelcome() {
    Get.offAllNamed(WelcomeView.viewRouteName);
  }

  final UserController controller = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async => await controller.logout(),
                    iconSize: 48,
                    icon: const Icon(
                      Icons.logout,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/img/app_logo.png'),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 117, 153, 204),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Select a Service",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InkWell(
              onTap: () async => await Get.toNamed(DoctorView.viewRouteName),
              child: Container(
                width: 350,
                height: 75,
                margin: const EdgeInsets.fromLTRB(5, 150, 0, 0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/img/doctor1.png'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Text(
                      "Consult doctor",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async => await Get.toNamed(PharmacyView.viewRouteName),
              child: Container(
                width: 350,
                height: 75,
                margin: const EdgeInsets.only(left: 5),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/img/pharmacy.png'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Text(
                      "Pharmacy",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await Get.toNamed(
                  MedicineDoseView.viewRouteName,
                  preventDuplicates: true,
                );
              },
              child: Container(
                width: 350,
                height: 75,
                margin: const EdgeInsets.fromLTRB(5, 0, 0, 50),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/img/medicine.png'),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Text(
                      "Dates Medicine Doses",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
