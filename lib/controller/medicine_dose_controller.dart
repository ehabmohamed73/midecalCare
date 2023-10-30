import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/controller/notifications_controller.dart';
import 'package:medical_care_app/controller/user_controller.dart';
import 'package:medical_care_app/model/medicine_dose_model.dart';

class MedicineDoseController extends GetxController {
  late List<MedicineDoseModel> medicinesDoses = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController doseCountController = TextEditingController();
  TextEditingController hoursController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  NotificationsController notificationsController = NotificationsController();
  CollectionReference db =
      FirebaseFirestore.instance.collection('medicine_dose');
  MedicineDoseModel medicineDoseTemp =
      MedicineDoseModel("", "", "", 0, "", 0, "");
  UserController userController = Get.find<UserController>();
  late int index;

  @override
  void onReady() {
    getAllData();
    super.onReady();
  }

  // fetch all data of medicine doses collection from database
  getAllData() async {
    var data = await db
        .where("user_id", isEqualTo: userController.user.generatedID)
        .get();
    medicinesDoses = data.docs.map(
      (e) {
        medicineDoseTemp = MedicineDoseModel("", "", "", 0, "", 0, "");
        medicineDoseTemp.generatedID = e.id;
        medicineDoseTemp.fromMap(e.data() as Map<String, dynamic>);
        return medicineDoseTemp;
      },
    ).toList();
    _generateNotifications();
    update();
  }

  Future<void> _generateOneNotification(int position) async {
    notificationsController.scheduledNotifications(
      id: Random().nextInt(1024),
      title: medicinesDoses[position].medicineName,
      body: "It's time to take it",
      time: medicinesDoses[position].doseTime,
    );

    medicinesDoses[position].takenDoses += 1;
    await modifyInDatabase(position);
  }

  Future<void> _generateNotifications() async {
    if (medicinesDoses.isNotEmpty) {
      for (int i = 0; i < medicinesDoses.length; i++) {
        if (medicinesDoses[i].doseCount > medicinesDoses[i].takenDoses) {
          // split date to year, month and day
          List<String> tempDate = medicinesDoses[i].notificationDate.split("/");
          // split time to hour and minute
          List<String> tempTime = medicinesDoses[i].doseTime.split(":");

          if (DateTime.now().year >= int.parse(tempDate[0]) && // year
                  DateTime.now().month >= int.parse(tempDate[1]) && // month
                  DateTime.now().day > int.parse(tempDate[2]) && // day
                  DateTime.now().hour >= int.parse(tempTime[0]) && // hour
                  DateTime.now().minute >= int.parse(tempTime[1]) // minute
              ) {
            medicinesDoses[i].notificationDate =
                "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}";
            _generateOneNotification(i);
          }
        }
      }
      update();
    }
  }

  MedicineDoseModel getAllMedicinesDoses(int index) {
    return medicinesDoses[index];
  }

  // add data from the controller to the database and store it as a new document
  addToDatebase() async {
    medicineDoseTemp.fromMap(
      {
        "user_id": userController.user.generatedID,
        "medicine_name": nameController.text,
        "dose_count": int.parse(doseCountController.text),
        "dose_time": "${hoursController.text}:${minutesController.text}",
        "taken_dose": 0,
        "notification_date":
            "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}",
      },
    );
    await db.add(medicineDoseTemp.toMap()).then(
          (value) => medicineDoseTemp.generatedID = value.id,
        );
    medicinesDoses.add(medicineDoseTemp);
    _generateOneNotification(medicinesDoses.length - 1);
    update();
  }

  void initilizeFormFields() {
    medicineDoseTemp = MedicineDoseModel("", "", "", 0, "", 0, "");
    nameController.clear();
    doseCountController.clear();
    index = -1;
    hoursController.text = TimeOfDay.now().toString().substring(10, 12);
    minutesController.text = TimeOfDay.now().toString().substring(13, 15);
  }

  Future<void> modifyInDatabase(int position) async {
    await db
        .doc(medicinesDoses[position].generatedID)
        .update(medicinesDoses[position].toMap());
  }

  // update database with the data in the controller
  Future<void> modifyInDatabaseGUI() async {
    medicineDoseTemp.fromMap(
      {
        "user_id": medicinesDoses[index].userID,
        "medicine_name": nameController.text,
        "dose_count": int.parse(doseCountController.text),
        "dose_time": "${hoursController.text}:${minutesController.text}",
        "taken_dose": medicinesDoses[index].takenDoses,
        "notification_date": medicinesDoses[index].notificationDate,
      },
    );
    medicinesDoses[index].fromMap(medicineDoseTemp.toMap());
    modifyInDatabase(index);
    update();
  }

  // delete a medicine and it's all doses' times from the databse
  void deleteMedicineDose(String id) {
    db.doc(id).delete();
    medicinesDoses.removeWhere(
      (element) => element.generatedID == id,
    );
    update();
  }

  // set data from model to form to modify it
  loadDataToForm() {
    if (index >= 0) {
      nameController.text = medicinesDoses[index].medicineName;
      doseCountController.text = medicinesDoses[index].doseCount.toString();
      List<String> time = medicinesDoses[index].doseTime.split(":");
      hoursController.text = time[0];
      minutesController.text = time[1];
    }
  }

  // Save change and updates from the controller to the database
  saveChanges() {
    if (index >= 0) {
      modifyInDatabaseGUI();
    } else {
      addToDatebase();
    }
  }
}
