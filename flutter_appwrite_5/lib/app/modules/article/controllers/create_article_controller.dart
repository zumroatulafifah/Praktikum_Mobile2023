import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class CreateArticleController extends GetxController {
  // AuthRepository authRepository;
  // CreateArticleController(this.authRepos)

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController judulEditingController = TextEditingController();
  TextEditingController penulisEditingController = TextEditingController();

  bool isFormValid = false;

  final GetStorage _getStorage = GetStorage();

  var imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    judulEditingController.dispose();
    penulisEditingController.dispose();
  }

  void clearTextEditingController() {
    judulEditingController.clear();
    penulisEditingController.clear();
  }

  String? validateJudul(String value) {
    if (value.isEmpty) {
      return "Provide valid Judul";
    }
    return null;
  }

  String? validatePenulis(String value) {
    if (value.isEmpty) {
      return "Provide valid Penulis";
    }
    return null;
  }

  // void selectImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  //   if(image != null){
  //     imagePath.value = image.path;
  //   } else {
  //     CustomSnackBar.showErrorSnackBar(
  //       context : Get.context,
  //       title: "Error",
  //       message : "Image Selection Cancelled");
  //   }

  //   void
}
