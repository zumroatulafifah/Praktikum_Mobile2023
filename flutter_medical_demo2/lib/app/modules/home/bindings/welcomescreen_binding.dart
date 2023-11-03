import 'package:flutter_medical_demo1/app/modules/home/controllers/profil_controller.dart';
import 'package:flutter_medical_demo1/app/modules/home/controllers/welcomescreen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class welcomescreen_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<welcomescreen_controller>(
      () => welcomescreen_controller(),
    );
  }
}
