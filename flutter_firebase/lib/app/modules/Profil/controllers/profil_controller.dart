import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final _imagePath = ''.obs;

  String get imagePath => _imagePath.value;

  @override
  void onInit() {
    final box = GetStorage();
    _imagePath.value = box.read('profile_image') ?? '';
    super.onInit();
  }

  void setImagePath(String path) {
    _imagePath.value = path;
    final box = GetStorage();
    box.write('profile_image', path);
  }
}
