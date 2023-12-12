import 'package:appwrite/appwrite.dart';
import 'package:flutter_firebase/app/data/service/appwrite_endpoint.dart';
import 'package:flutter_firebase/app/data/service/appwrite_service.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  static DiscoverController discoverController = Get.find();
  final UserClient db = Get.put(UserClient());
  // Ini untuk mendapatkan data document dalam collection dari discover_item
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  deleteDocuments(String id) {
    final client =
        Client().setEndpoint(AppWrite.Enpoint).setProject(AppWrite.ProjectId);
    final database = Databases(client);
    final result = database.deleteDocument(
      databaseId: AppWrite.DatabaseId,
      collectionId: AppWrite.CollectionId,
      documentId: id,
    );

    result.then((response) {
      print(response);
      Get.offAllNamed("/discover");
    }).catchError((error) {
      print(error.response);
    });
  }

}
