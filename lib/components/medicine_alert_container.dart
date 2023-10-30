import 'package:flutter/material.dart';

class MedicineAlertContainer extends StatelessWidget {
  const MedicineAlertContainer({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.taken,
    required this.count,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final int count;
  final int taken;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 24,
                    color: foregroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: List.generate(
                    count,
                    (index) => SizedBox(
                      width: 30,
                      child: Checkbox(
                        value: (index + 1 <= taken) ? true : false,
                        onChanged: (value) {},
                      ),
                    ),
                  ).reversed.toList(),
                ),
                // SizedBox(
                //   height: 100,
                //   child: GridView.count(
                //     crossAxisCount: 5,
                //     reverse: true,
                //     children: List.generate(
                //       count,
                //       (index) => SizedBox(
                //         width: 30,
                //         child: Checkbox(
                //           value: (index + 1 <= taken) ? true : false,
                //           onChanged: (value) {},
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
