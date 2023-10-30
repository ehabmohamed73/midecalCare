import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_care_app/controller/rate_controller.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateController>(
      init: RateController(),
      builder: (controller) => Center(
        widthFactor: double.maxFinite,
        child: SizedBox(
          height: 100,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                5,
                (index) => StarButton(
                  value: index + 1,
                  checked: controller.stars >= index + 1 ? true : false,
                  checkedIcon: Icons.star,
                  uncheckedIcon: Icons.star_border_outlined,
                  onpress: () => controller.changeRate(index + 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StarButton extends StatelessWidget {
  const StarButton({
    super.key,
    required this.value,
    required this.checked,
    required this.checkedIcon,
    required this.uncheckedIcon,
    required this.onpress,
  });
  final int value;
  final bool checked;
  final IconData checkedIcon;
  final IconData uncheckedIcon;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onpress(),
      iconSize: 56,
      icon: Icon(
        checked ? checkedIcon : uncheckedIcon,
        size: 64,
        color: const Color(0xFF7D96C8),
      ),
    );
  }
}
