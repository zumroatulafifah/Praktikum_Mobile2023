import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/data/service/appwrite_endpoint.dart';
import 'package:flutter_firebase/app/data/service/appwrite_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class signup_controller extends GetxController {
  static signup_controller Signup_controller = Get.find();
  static UserClient endpoint = Get.put(UserClient());
  final TextEditingController JudulController = TextEditingController();
  final TextEditingController DeskripsiController = TextEditingController();
  late String file;
  String idPass = "";
  String descPass = "";
  String titlePass = "";
  bool edit = false;
  final _imagePath = ''.obs;
  String get imagePath => _imagePath.value;
  Databases? databases;
  Storage? storage;

  @override
  void onInit() {
    final box = GetStorage();
    _imagePath.value = box.read('profile_image') ?? '';
    super.onInit();
    databases = Databases(endpoint.client);
    storage = Storage(endpoint.client);
  }

  void setImagePath(String path) {
    _imagePath.value = path;
    final box = GetStorage();
    box.write('profile_image', path);
    file = path;
    print(file);
    print(path);
  }

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      print(pickedImage.path);
      setImagePath(pickedImage.path);
    }
  }

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      print(imageGallery.path);
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

  Future inputNews(Map map) async {
    try {
      final result = await databases!.createDocument(
          databaseId: AppWrite.DatabaseId,
          collectionId: AppWrite.CollectionId,
          documentId: ID.unique(),
          data: map,
          permissions: [
            Permission.read(Role.any()),
            Permission.update(Role.any()),
            Permission.delete(Role.any()),
          ]);
      Get.snackbar("Berhasil", "Berita baru berhasil ditambahkan",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      print(result);
    } catch (err) {
      Get.defaultDialog(title: "Error Database", content: Text("$err"));
    }
  }

  Future updateDiscussion(Map map) async {
    try {
      final result = await databases!.updateDocument(
        databaseId: AppWrite.DatabaseId,
        documentId: idPass,
        collectionId: AppWrite.CollectionId,
        data: map,
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
      print("DatabaseController:: inputName $result");
      Get.offAllNamed('/discover');
    } catch (error) {
      Get.defaultDialog(
        title: "Error Database",
        titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
        titleStyle: Get.context?.theme.textTheme.titleLarge,
        content: Text(
          "$error",
          style: Get.context?.theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
      );
    }
  }

  getIdDocument(String id, String desc, String title, bool editable) {
    idPass = id;
    descPass = desc;
    titlePass = title;
    edit = editable;
  }
}
