import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckController extends GetxController {
  List<String> questions = [
    "Are you currently or recently suffering from any respiratory symptoms?",
    "Do you suffer from high blood pressure or take medication for it?",
    "Do you suffer from chronic medical conditions?",
    "Do you suffer from high temperature?",
    "Are there hereditary diseases in the family?",
    "Have you had any injuries or accidents recently?",
  ];
  late List<int> answers;
  double result = 0.0;
  List<Map<String, dynamic>> advises = [
    {
      'text': "You ara OK",
      'icon': Icons.done,
      'color': Colors.green,
    },
    {
      'text': "You should be fine",
      'icon': Icons.done,
      'color': Colors.green.shade200,
    },
    {
      'text': "I think you should go to the doctor",
      'icon': Icons.warning,
      'color': Colors.yellow,
    },
    {
      'text': "You have to go to the doctor",
      'icon': Icons.warning,
      'color': Colors.orange,
    },
    {
      'text': "Go to the doctor, now!!!",
      'icon': Icons.warning,
      'color': Colors.red,
    },
  ];

  void answer(int value, int index) {
    if (answers[index] == value) {
      answers[index] = 1;
    } else {
      answers[index] = value;
    }
    update();
  }

  @override
  void onInit() {
    answers = List.generate(questions.length, (index) => 1);
    super.onInit();
  }

  Map<String, dynamic> getResult() {
    result = answers.where((element) => element == 0).toList().length /
        questions.length;
    if (result >= 0 && result <= 0.20) {
      return advises[0];
    } else if (result > 0.20 && result <= 0.40) {
      return advises[1];
    } else if (result > 0.40 && result <= 0.60) {
      return advises[2];
    } else if (result > 0.60 && result <= 0.80) {
      return advises[3];
    } else {
      return advises[4];
    }
  }
}
