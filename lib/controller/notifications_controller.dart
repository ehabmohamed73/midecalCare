import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationsController extends GetxController {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    tz.initializeTimeZones();
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future scheduledNotifications({
    int id = 0,
    String? title,
    String? body,
    String? time,
  }) async {
    List<String> temp = time!.split(":");
    int minutes = int.parse(temp[1]);
    int hours = int.parse(temp[0]);
    int days = 0;

    // calculate the deffinence between current minute and recieved minute
    if (DateTime.now().minute <= minutes) {
      minutes -= DateTime.now().minute;
    } else {
      minutes = (minutes - DateTime.now().minute) + 60;
    }

    // increase the hours if minuts are more than 24
    if (minutes >= 60) {
      hours += 1;
      minutes -= 60;
    }

    // calculate the deffinence between current hour and recieved hour
    if (DateTime.now().hour <= hours) {
      hours -= DateTime.now().hour;
    } else {
      hours = hours - DateTime.now().hour + 24;
    }

    // increase the day if hours are more than 24
    if (hours >= 24) {
      days = 1;
      hours -= 24;
    }

    final exactTime = DateTime.now().add(
      Duration(
        days: days,
        hours: hours,
        minutes: minutes,
      ),
    );
    return await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        exactTime,
        tz.local,
      ),
      await notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  void onInit() {
    initNotification();
    super.onInit();
  }
}
