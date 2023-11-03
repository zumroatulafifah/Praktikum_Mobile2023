import 'package:flutter/material.dart';
import 'package:flutter_medical_demo1/app/modules/home/controllers/signup_controller.dart';
import 'package:flutter_medical_demo1/app/modules/home/views/screens/welcome_screen.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
