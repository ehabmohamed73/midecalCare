import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({super.key, required this.childrens});

  final Widget childrens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // padding: const EdgeInsets.only(top: 30, right: 10),
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.75, 0.85, 0.95],
              colors: [
                Color.fromARGB(255, 221, 221, 221),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 221, 221, 221),
              ],
            ),
          ),
          child: childrens,
        ),
      ),
    );
  }
}
