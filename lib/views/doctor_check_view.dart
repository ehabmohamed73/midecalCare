import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/question_container.dart';
import 'package:medical_care_app/components/my_button.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/controller/check_controller.dart';
import 'package:medical_care_app/views/rate_view.dart';

class DoctorCheckView extends StatelessWidget {
  const DoctorCheckView({super.key});

  static const String viewRouteName = "/DoctorCheckView";

  void showResult(Map<String, dynamic> map) {
    Get.defaultDialog(
      title: 'Check result',
      content: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                map['icon'],
                color: map['color'],
                size: 48,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: Text(
                map['text'],
              ),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () async {
            await Get.offNamed(
              RateView.viewRouteName,
            );
          },
          textColor: Colors.green,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Complete",
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("object 2");
    return PageContainer(
      childrens: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Expanded(
            child: GetBuilder<CheckController>(
              init: CheckController(),
              builder: (controller) => ListView(
                children: List.generate(
                  controller.questions.length,
                  (index) => QuestionContainer(
                    text: controller.questions[index],
                    value: controller.answers[index],
                    index: index,
                    event: (index, value) => controller.answer(value, index),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/img/doctor2.png'),
                GetBuilder<CheckController>(
                  builder: (controller) => MyButton(
                    onpress: () async => showResult(
                      controller.getResult(),
                    ),
                    text: "Result",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
