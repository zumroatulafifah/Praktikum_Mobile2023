// import 'package:flutter/material.dart';
// import 'package:flutter_medical_demo1/screens/welcome_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WelcomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_medical_demo1/controller/WelcomeController.dart';
import 'package:get/get.dart';
import 'package:flutter_medical_demo1/screens/welcome_screen.dart';
import 'package:flutter_medical_demo1/controller/WelcomeController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WelcomeScreen(),
    );
  }
}
