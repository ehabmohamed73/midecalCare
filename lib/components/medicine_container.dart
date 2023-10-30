import 'package:flutter/material.dart';

class MedicineContainer extends StatelessWidget {
  const MedicineContainer({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.ontap,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        width: double.infinity,
        height: 75.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: foregroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
