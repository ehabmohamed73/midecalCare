// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medical_care_app/components/page_container.dart';
// import 'package:medical_care_app/controller/medicine_dose_controller.dart';
// // import 'package:medical_care_app/controller/user_controller.dart';

// class DoseFormView extends StatelessWidget {
//   DoseFormView({super.key});

//   static const String viewRouteName = "/DoseFormView";
//   final MedicineDoseController controller = MedicineDoseController();

//   @override
//   Widget build(BuildContext context) {
//     return PageContainer(
//       childrens: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GetBuilder<MedicineDoseController>(
//                 builder: (controller) => TextField(
//                   controller: controller.nameController,
//                   decoration: const InputDecoration(
//                     hintText: "Medicine name",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GetBuilder<MedicineDoseController>(
//                 builder: (controller) => TextField(
//                   controller: controller.doseCountController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(
//                     hintText: "Dose Count",
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         width: 1,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               // color: Colors.red,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                 color: Colors.blue.shade300,
//                 width: 2,
//               )),
//               margin: const EdgeInsets.all(8.0),
//               padding: const EdgeInsets.all(6.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Add a dose time: ",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   GetBuilder<MedicineDoseController>(
//                     builder: (controller) => IconButton(
//                       onPressed: () async {
//                         var date = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         // controller.updateDoseDate(
//                         //     0,
//                         //     "${date!.hour.toString()}:${date.minute.toString()}",
//                         //     false);
//                       },
//                       icon: Icon(
//                         (Icons.add_alarm),
//                         size: 32,
//                         color: Colors.blue.shade300,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             GetBuilder<MedicineDoseController>(
//               builder: (controller) => Expanded(
//                 child: (controller.getMedicineDoses().isNotEmpty)
//                     ? ListView(
//                         children: List.generate(
//                           controller.getMedicineDoses().length,
//                           (index) {
//                             return ListTile(
//                               onTap: () async {
//                                 print('clicked');
//                                 List<String> temp = controller
//                                     .getMedicineDoses()
//                                     .keys
//                                     .elementAt(index)
//                                     .split(":")
//                                     .toList()
//                                     .cast<String>();
//                                 var data = await showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay(
//                                     hour: int.parse(temp[0]),
//                                     minute: int.parse(temp[1]),
//                                   ),
//                                 );
//                                 print("time picker edit:$data");
//                               },
//                               onLongPress: () async {},
//                               title: Text(
//                                 controller
//                                     .getMedicineDoses()
//                                     .keys
//                                     .elementAt(index),
//                               ),
//                               trailing: Checkbox(
//                                 value: controller
//                                     .getMedicineDoses()
//                                     .values
//                                     .elementAt(index),
//                                 onChanged: (value) {
//                                   controller.updateDoseDate(
//                                     index,
//                                     controller
//                                         .getMedicineDoses()
//                                         .keys
//                                         .elementAt(index),
//                                     value!,
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                       )
//                     : Center(
//                         child: Icon(
//                           Icons.alarm_off,
//                           size: 100,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GetBuilder<MedicineDoseController>(
//                   builder: (controller) => MaterialButton(
//                     onPressed: () {
//                       controller.cancelChanges();
//                       Get.back();
//                     },
//                     color: Colors.red,
//                     height: 50,
//                     child: const Text(
//                       "Canel",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 GetBuilder<MedicineDoseController>(
//                   builder: (controller) => MaterialButton(
//                     onPressed: () => controller.saveChanges(),
//                     color: Colors.green,
//                     height: 50,
//                     child: const Text(
//                       "Save",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
