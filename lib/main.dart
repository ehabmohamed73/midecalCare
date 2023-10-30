import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_care_app/app_binding.dart';
import 'package:medical_care_app/firebase_options.dart';
import 'package:medical_care_app/views/doctor_check_view.dart';
import 'package:medical_care_app/views/doctor_view.dart';
import 'package:medical_care_app/views/home_view.dart';
import 'package:medical_care_app/views/medicine_dose_view.dart';
import 'package:medical_care_app/views/medicine_info_view.dart';
import 'package:medical_care_app/views/pharmacy_view.dart';
import 'package:medical_care_app/views/rate_view.dart';
import 'package:medical_care_app/views/sign_in_view.dart';
import 'package:medical_care_app/views/sign_up_view.dart';
import 'package:medical_care_app/views/thanks_view.dart';
import 'package:medical_care_app/views/welcome_view.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // if (kDebugMode) {
  //   try {
  //     FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialBinding: AppBinding(),
      defaultTransition: Transition.fade,
      initialRoute: WelcomeView.viewRouteName,
      getPages: [
        GetPage(
          name: WelcomeView.viewRouteName,
          page: () => const WelcomeView(),
        ),
        GetPage(
          name: SignInView.viewRouteName,
          page: () => SignInView(),
        ),
        GetPage(
          name: SignUpView.viewRouteName,
          page: () => SignUpView(),
        ),
        GetPage(
          name: HomeView.viewRouteName,
          page: () => HomeView(),
        ),
        GetPage(
          name: DoctorView.viewRouteName,
          page: () => const DoctorView(),
        ),
        GetPage(
          name: DoctorCheckView.viewRouteName,
          page: () => const DoctorCheckView(),
        ),
        GetPage(
          name: RateView.viewRouteName,
          page: () => const RateView(),
        ),
        GetPage(
          name: PharmacyView.viewRouteName,
          page: () => const PharmacyView(),
        ),
        GetPage(
          name: MedicineInfoView.viewRouteName,
          page: () => MedicineInfoView(),
        ),
        GetPage(
          name: MedicineDoseView.viewRouteName,
          page: () => MedicineDoseView(),
        ),
        GetPage(
          name: ThanksView.viewRouteName,
          page: () => const ThanksView(),
        ),
      ],
    );
  }
}
