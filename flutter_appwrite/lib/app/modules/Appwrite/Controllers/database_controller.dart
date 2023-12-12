import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/modules/Appwrite/Controllers/client_controller.dart';
import 'package:get/get.dart';

class DatabaseController extends ClientController {
  Databases? databases;
  Storage? storage;

  Uint8List? imageBytes;

  @override
  void onInit() {
    super.onInit();
// appwrite
    databases = Databases(client);
    storage = Storage(client);
    getDoc();
  }

  Future getDoc() async {
    try {
      // final docs = await databases!.listDocuments(
      //     databaseId: "65657e482ee3b5e9aed4",
      //     collectionId: "65657e5180de5047d923");
      // // documentId: "65657fcc282ec24e27ff");

      final docs = databases!.createDocument(
          databaseId: "65657e482ee3b5e9aed4",
          collectionId: "65657e5180de5047d923",
          documentId: "65657fcc282ec24e27ff",
          data: {});

      docs
      .then((response) {
        print(response);
      }).catchError((error) {
        print(error.response);
      });

      // for (var document in docs.documents) {
      //   print(document.data);
      // }

      // final result = await storage?.getFileView(bucketId: "6568a566bad7dbc1b491", fileId: "6568a59328800144c40d" );
      // imageBytes = result!;
      // print("DatabaseController:: getDocs ${docs?.data}");
      // print("DatabaseController:: getDocs $result");
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
}
