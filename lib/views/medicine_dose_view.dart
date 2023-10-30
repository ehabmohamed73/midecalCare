import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/medicine_alert_container.dart';
import 'package:medical_care_app/components/page_container.dart';
import 'package:medical_care_app/controller/medicine_dose_controller.dart';
import 'package:medical_care_app/controller/user_controller.dart';

class MedicineDoseView extends StatelessWidget {
  MedicineDoseView({super.key});

  static const String viewRouteName = "/MedicineDoseView";
  final UserController userController = Get.find<UserController>();
  final MedicineDoseController doseController =
      Get.put(MedicineDoseController());

  void doseFormDialog() async {
    Get.defaultDialog(
      title: "Add dose",
      content: Container(
        width: 400,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.center,
                controller: doseController.nameController,
                decoration: const InputDecoration(
                  hintText: "Medicine name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: doseController.doseCountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Dose Count",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 40,
                  child: Text("Time"),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: doseController.hoursController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Hour",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: doseController.minutesController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Minute",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              child: const Text("Cancel"),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () async {
                await doseController.saveChanges();
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              child: const Text("OK"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                            top: BorderSide(width: 2),
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/img/medicine.png'),
                            const Text(
                              "Medicine Dose",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Dose",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // doseController.setIndex = -1;
                                  doseController.initilizeFormFields();
                                  doseFormDialog();
                                },
                                iconSize: 48,
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    child: Image.asset('assets/img/app_logo.png'),
                  ),
                ],
              ),
            ),
            GetBuilder<MedicineDoseController>(
              builder: (doseController) {
                return Expanded(
                  child: (doseController.medicinesDoses.isNotEmpty)
                      ? ListView(
                          children: List.generate(
                            doseController.medicinesDoses.length,
                            (index) => InkWell(
                              onDoubleTap: () async {
                                doseController.initilizeFormFields();
                                doseController.index = index;
                                doseController.loadDataToForm();
                                doseFormDialog();
                              },
                              onLongPress: () async =>
                                  doseController.deleteMedicineDose(
                                doseController
                                    .medicinesDoses[index].generatedID,
                              ),
                              child: MedicineAlertContainer(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                count: doseController
                                    .medicinesDoses[index].doseCount,
                                text: doseController
                                    .medicinesDoses[index].medicineName
                                    .toString(),
                                taken: doseController
                                    .medicinesDoses[index].takenDoses,
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.notifications_off,
                            size: 150.0,
                            color: Colors.grey.shade400,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
