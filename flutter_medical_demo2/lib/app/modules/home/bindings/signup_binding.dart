import 'package:flutter_medical_demo1/app/modules/home/controllers/profil_controller.dart';
import 'package:flutter_medical_demo1/app/modules/home/controllers/signup_controller.dart';
import 'package:get/get.dart';

class signup_screen_binding extends Bindings {
  // @override
  // void dependencies() {
  //   Get.lazyPut<signup_controller>(
  //     () => signup_controller(),
  //   );
  // }

  @override
  void dependencies() {
    Get.put(signup_controller());
  }
}
