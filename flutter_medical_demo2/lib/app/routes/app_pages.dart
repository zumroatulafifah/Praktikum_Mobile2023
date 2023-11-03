import 'package:flutter_medical_demo1/app/modules/home/bindings/welcomescreen_binding.dart';
import 'package:flutter_medical_demo1/app/modules/home/views/screens/login_screen.dart';
import 'package:flutter_medical_demo1/app/modules/home/views/screens/signup_screen.dart';
import 'package:flutter_medical_demo1/app/modules/home/views/screens/welcome_screen.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/signup_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.welcome; //yg pertama kali di munculin

  static final routes = [
    GetPage(
      name: _Paths.welcome,
      page: () => WelcomeScreen(),
      binding: welcomescreen_binding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => loginScreen(),
    ),
    GetPage(
        name: _Paths.sign,
        page: () => SignUpScreen(),
        binding: signup_screen_binding())
  ];
}
