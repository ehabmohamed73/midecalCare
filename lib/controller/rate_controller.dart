import 'package:get/get.dart';

class RateController extends GetxController {
  int stars = 0;

  changeRate(int value) {
    if (value == stars) {
      stars = 0;
    } else {
      stars = value;
    }
    update();
  }
}
