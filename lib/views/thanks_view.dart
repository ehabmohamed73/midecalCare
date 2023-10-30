import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/views/welcome_view.dart';

class ThanksView extends StatelessWidget {
  const ThanksView({super.key});

  static const String viewRouteName = "/ThanksView";

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 72.0),
                child: Image.asset('assets/img/app_logo.png'),
              ),
              InkWell(
                onTap: () async =>
                    await Get.offNamed(WelcomeView.viewRouteName),
                child: const Text(
                  'Thand you for\nusing our\napplication',
                  style: TextStyle(
                    fontSize: 36.0,
                    height: 1.0,
                    color: Color.fromARGB(255, 125, 150, 200),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
