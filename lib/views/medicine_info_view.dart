import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/components/page_container.dart';

class MedicineInfoView extends StatelessWidget {
  MedicineInfoView({super.key});

  static const viewRouteName = "/MedicineInfoView";

  final Map<String, String> arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      childrens: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: arguments.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            // padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2.5,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 10,
                ),
              ],
              color: Colors.lightBlue[50],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  // height: 40,
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    arguments.keys.elementAt(index),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  child: Text(
                    arguments.values.elementAt(index),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
