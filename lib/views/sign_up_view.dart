import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/my_button.dart';
import 'package:medical_care_app/controller/user_controller.dart';
import 'package:medical_care_app/views/sign_in_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();
  static const String viewRouteName = "/SignUpView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20, right: 5),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.75, 0.85, 0.95],
            colors: [
              Color.fromARGB(255, 221, 221, 221),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 221, 221, 221),
            ],
          ),
        ),
        child: ListView(
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
                "Sign up",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 75,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  InkWell(
                    onTap: () async {
                      await Get.offNamed(SignInView.viewRouteName);
                    },
                    child: const Text(
                      "log in here",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: GetBuilder<UserController>(
                // init: Get.find<UserController>(),
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
                        height: 55,
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
                        height: 20,
                      ),
                      const Text(
                        'ID',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 4),
                        height: 55,
                        child: TextFormField(
                          controller: controller.idTC,
                          validator: (value) {
                            if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
                              return 'Numeric characters only';
                            } else if (value.isEmpty) {
                              return "ID most not be empty";
                            } else if (!(value.length >= 3 &&
                                value.length <= 12)) {
                              return "ID most be from 3 to 12 length";
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
                        height: 20,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 4),
                        height: 55,
                        child: TextFormField(
                          controller: controller.emailTC,
                          validator: (value) {
                            // if (RegExp(
                            //         r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
                            //     .hasMatch(value!)) {
                            if (!value!.isEmail) {
                              return 'Invalid email';
                            } else if (value.isEmpty) {
                              return "Email most not be empty";
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
                        height: 20,
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
                        height: 55,
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
                              await controller.signUp();
                              await controller.login();
                            } else {
                              ScaffoldMessenger.maybeOf(context)!.showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "On of the fields has an invalid data",
                                  ),
                                ),
                              );
                            }
                          },
                          text: "Sign up",
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
