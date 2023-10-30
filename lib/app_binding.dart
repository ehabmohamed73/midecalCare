import 'package:get/get.dart';
import 'package:medical_care_app/controller/notifications_controller.dart';
import 'package:medical_care_app/controller/user_controller.dart';

class AppBinding implements Bindings {
  UserController userController = UserController();
  NotificationsController notificationsController = NotificationsController();

  @override
  void dependencies() {
    Get.put<UserController>(userController, permanent: true);
    Get.put<NotificationsController>(notificationsController, permanent: true);
  }
}
