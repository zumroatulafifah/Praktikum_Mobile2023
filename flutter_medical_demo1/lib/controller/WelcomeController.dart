// import 'package:get/get.dart';

// class controlller extends GetxController {
//   bool passToggle = true;
//   void onTap() {
//     if (passToggle == true) {
//       passToggle = false;
//     } else {
//       passToggle = true;
//     }
//     // setState(() {}); //melkaukan pembaruan tampilan
//   }
// }

import 'package:get/get.dart';
import 'package:flutter_medical_demo1/screens/login_screen.dart';

class WelcomeController extends GetxController {
  void goToLoginScreen() {
    Get.to(() => loginScreen());
  }
}
