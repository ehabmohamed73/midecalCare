import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/my_button.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/views/sign_in_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  static const String viewRouteName = "/StartView";

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 72.0),
              child: Image.asset('assets/img/app_logo.png'),
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36.0,
                height: 1.0,
                color: Color.fromARGB(255, 125, 150, 200),
              ),
            ),
            const Text(
              'to our application',
              style: TextStyle(
                fontSize: 26.0,
                height: 1.0,
                color: Color(0xFF7D96C8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 72.0),
              child: MyButton(
                onpress: () {
                  //   var controller = NotificationsController();
                  //   controller.scheduledNotifications(
                  //     id: 1201,
                  //     title: "Medical care",
                  //     body: "Hi there",
                  //   );
                  //   //  NotificationsController().showNotification(
                  //   // id: Random().nextInt(1204), title: "app", body: 'test');
                  Get.toNamed(SignInView.viewRouteName);
                },
                text: "Get started",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
