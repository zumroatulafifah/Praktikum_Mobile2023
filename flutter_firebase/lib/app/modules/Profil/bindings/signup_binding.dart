import 'package:flutter_firebase/app/modules/Profil/controllers/signup_controller.dart';
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
