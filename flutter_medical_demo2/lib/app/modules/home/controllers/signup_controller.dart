import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class signup_controller extends GetxController {
  static signup_controller Signup_controller = Get.find();

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

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImagePath(pickedImage.path);
    }
  }

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      setImagePath(imageGallery.path);
    }
  }

  Future saveProfile() async {
    final imagePath = _imagePath;
    if (imagePath.isNotEmpty) {
      // Lakukan tindakan penyimpanan foto profil jika diperlukan.
      Get.snackbar("Profil Disimpan", "Profil Anda telah berhasil disimpan",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Silakan pilih foto profil terlebih dahulu",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
