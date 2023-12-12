import 'package:appwrite/models.dart';
import 'package:flutter_firebase/app/data/service/appwrite_endpoint.dart';
import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';

class UserClient extends GetxController {
  Client client = Client();
  RxList<Document> disscussion = <Document>[].obs;
  Databases? databases;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    client
        .setEndpoint(AppWrite.Enpoint)
        .setProject(AppWrite.ProjectId)
        .setSelfSigned(status: true);
    databases = Databases(client);
    fetchDiscussion();
  }

  Future<void> fetchDiscussion() async {
    try {
      var response = await databases!.listDocuments(
          collectionId: AppWrite.CollectionId, databaseId: AppWrite.DatabaseId);
      disscussion.assignAll(response.documents);
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
