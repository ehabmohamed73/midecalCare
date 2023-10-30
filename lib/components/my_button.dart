import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onpress, required this.text});
  final Function onpress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpress();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 7.5,
        shadowColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 75,
        ),
        backgroundColor: const Color.fromARGB(255, 117, 153, 204),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
