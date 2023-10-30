import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/model/user_model.dart';
import 'package:medical_care_app/views/home_view.dart';
import 'package:medical_care_app/views/thanks_view.dart';

class UserController extends GetxController {
  late UserModel user;
  final db = FirebaseFirestore.instance;
  late String username;
  final idTC = TextEditingController();
  final usernameTC = TextEditingController();
  final emailTC = TextEditingController();
  final passwordTC = TextEditingController();

  // login process
  Future<void> login() async {
    user = UserModel("", "", "", "");
    await db
        .collection('users')
        .where(
          'username',
          isEqualTo: usernameTC.text,
        )
        .where(
          "password",
          isEqualTo: passwordTC.text,
        )
        .get()
        .then((value) {
      user.fromMap(value.docs[0].data());
      user.generatedID = value.docs[0].id;
    });
    clearFields();
    update();
    await Get.offNamed(HomeView.viewRouteName);
  }

  Future<void> logout() async {
    user = UserModel("", "", "", "");
    update();
    await Get.offAllNamed(ThanksView.viewRouteName);
  }

  String getUserID() {
    return user.getGeneratedID();
  }

  Future<void> signUp() async {
    user = UserModel(idTC.text.toString(), usernameTC.text.toString(),
        emailTC.text.toString(), passwordTC.text.toString());
    await db.collection('users').add(user.toMap());
    clearFields();
    update();
    await Get.offNamed(HomeView.viewRouteName);
  }

  void clearFields() {
    usernameTC.clear();
    passwordTC.clear();
    emailTC.clear();
    idTC.clear();
  }
}
