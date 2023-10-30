import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.maxFinite,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.blue[300],
        ),
      ),
    );
  }
}
