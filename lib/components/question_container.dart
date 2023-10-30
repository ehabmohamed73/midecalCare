import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({
    super.key,
    required this.text,
    required this.value,
    required this.event,
    required this.index,
  });

  final String text;
  final int value;
  final int index;
  final Function event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      height: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: (value == 1)
                ? [
                    TextButton(
                      onPressed: () => event(index, 2),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.green,
                        fixedSize: const Size(20, 20),
                      ),
                      child: const Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () => event(index, 0),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        fixedSize: const Size(20, 20),
                      ),
                      child: const Text("No"),
                    ),
                  ]
                : value == 2
                    ? [
                        TextButton(
                          onPressed: () => event(index, 2),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                            fixedSize: const Size(20, 20),
                          ),
                          child: const Text("Yes"),
                        ),
                      ]
                    : [
                        TextButton(
                          onPressed: () => event(index, 0),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            fixedSize: const Size(20, 20),
                          ),
                          child: const Text("No"),
                        ),
                      ],
          ),
        ],
      ),
    );
  }
}
