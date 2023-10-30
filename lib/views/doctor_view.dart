import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/my_button.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/views/doctor_check_view.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  static const String viewRouteName = "/DoctorView";

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                          top: BorderSide(width: 2)),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/img/doctor1.png'),
                        const Text(
                          "Consult Doctor",
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Text(
                "Communicate with a doctor in an easy and new way with an online doctor",
                style: TextStyle(
                  color: Color(0xFF7D96C8),
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset('assets/img/doctor2.png'),
            ),
            MyButton(
              onpress: () async {
                await Get.toNamed(DoctorCheckView.viewRouteName);
              },
              text: "Conversation",
            ),
          ],
        ),
      ),
    );
  }
}
