import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/my_button.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/components/rating_stars.dart';
import 'package:medical_care_app/views/home_view.dart';

class RateView extends StatelessWidget {
  const RateView({super.key});

  static const String viewRouteName = "/RateView";

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 120,
                    child: Image.asset('assets/img/app_logo.png'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30),
              child: Text(
                "Your evaluation of the doctor’s service?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7D96C8),
                  fontSize: 36,
                ),
              ),
            ),
            const SizedBox(height: 100),
            const RatingStars(),
            const SizedBox(height: 100),
            MyButton(
              onpress: () async => await Get.offNamedUntil(
                HomeView.viewRouteName,
                (route) => Get.currentRoute == HomeView.viewRouteName,
              ),
              text: "Send",
            )
          ],
        ),
      ),
    );
  }
}
