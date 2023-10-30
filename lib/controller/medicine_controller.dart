import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/model/medicine_model.dart';

class MedicineController extends GetxController {
  List<MedicineModel> medicines = [];
  late CollectionReference db;
  bool dataIsReady = false;
  TextEditingController searchController = TextEditingController();
  List<MedicineModel> searchMedicines = [];
  bool isSearching = false;

  @override
  onReady() {
    db = FirebaseFirestore.instance.collection("الادوية");
    super.onReady();
    getAllDate();
  }

  // late var data;
  getAllDate() async {
    try {
      var data = await db.get();
      medicines = data.docs.map(
        (e) {
          Map<String, dynamic> data = e.data() as Map<String, dynamic>;
          var temp = MedicineModel(data);
          temp.setName(e.id);
          return temp;
        },
      ).toList();
      dataIsReady = true;
      update();
    } catch (e) {
      dataIsReady = false;
    }
  }

  String getName(int index) {
    return medicines[index].name;
  }

  MedicineModel getMedicine(int index) {
    return medicines[index];
  }

  search() {
    if (searchController.text.isEmpty) {
      isSearching = false;
      searchMedicines = [];
    } else {
      isSearching = true;
      searchMedicines = medicines
          .where(
            (element) => element.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()),
          )
          .toList();
    }
    update();
  }
}
