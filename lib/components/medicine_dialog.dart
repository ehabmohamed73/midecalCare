import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/controller/medicine_dose_controller.dart';

class MedicineDialog extends StatelessWidget {
  MedicineDialog({super.key});

  final controller = Get.find<MedicineDoseController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select a medicine"),
      // content: DropdownButton(
      // value: controller.allItems[0],
      // items: controller.allItems
      //     .map(
      //       (e) => DropdownMenuItem(
      //         value: e.toString(),
      //         child: Text(e.toString()),
      //       ),
      //     )
      //     .toList(),
      // onChanged: (value) {
      //   controller.setSelectedItem(value.toString());
      // },
      // ),
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
          child: const Text("Accept"),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
