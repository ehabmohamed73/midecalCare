import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/my_button.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/controller/user_controller.dart';
import 'package:medical_care_app/views/sign_up_view.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final _formKey = GlobalKey<FormState>();
  static const String viewRouteName = "/SignInView";

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              height: 100,
              child: Image.asset('assets/img/app_logo.png'),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Hello!",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 125,
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.topCenter,
              child: const Text(
                'sign in to continue',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: GetBuilder<UserController>(
                init: Get.find<UserController>(),
                builder: (controller) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 4),
                        height: 60,
                        child: TextFormField(
                          controller: controller.usernameTC,
                          validator: (value) {
                            if (RegExp(r'^[a-zA-Z0-9]$').hasMatch(value!)) {
                              return 'Alphabatic and numeric characters only';
                            } else if (value.isEmpty) {
                              return "Username most not be empty";
                            } else if (!(value.length >= 6 &&
                                value.length <= 20)) {
                              return "Username most be from 6 to 20 length";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(backgroundColor: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 4),
                        height: 60,
                        child: TextFormField(
                          controller: controller.passwordTC,
                          validator: (value) {
                            if (!RegExp(r'^(?=.*[a-zA-Z0-9]).+$')
                                .hasMatch(value!)) {
                              return 'Alphabatic and numeric characters only';
                            }
                            if (value.isEmpty) {
                              return "Password most not be empty";
                            }
                            if (!(value.length >= 4 && value.length <= 20)) {
                              return "Password most be from 4 to 20 length";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(backgroundColor: Colors.white),
                        ),
                      ),
                      Container(
                        height: 125,
                        alignment: Alignment.bottomCenter,
                        child: MyButton(
                          onpress: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.login();
                            } else {
                              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "One of the fields has an invalid data",
                                  ),
                                ),
                              );
                            }
                          },
                          text: "Login",
                        ),
                      ),
                      Container(
                        height: 125,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't you have an account?"),
                            InkWell(
                              onTap: () async {
                                controller.usernameTC.clear();
                                controller.passwordTC.clear();
                                await Get.offNamed(SignUpView.viewRouteName);
                              },
                              child: const Text(
                                "sign up here",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
