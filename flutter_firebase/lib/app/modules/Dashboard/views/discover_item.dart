import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/modules/Dashboard/bindings/dashboard_binding.dart';
import 'package:flutter_firebase/app/modules/Dashboard/controllers/discover_controller.dart';
import 'package:flutter_firebase/app/modules/Dashboard/views/article_screen.dart';
import 'package:flutter_firebase/app/modules/Profil/controllers/signup_controller.dart';
import 'package:get/get.dart';

class DiscoverItem extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String id;
  final String imagePath;
  final int tabs;
  DiscoverItem(
      {super.key,
      required this.judul,
      required this.deskripsi,
      required this.id,
      required this.imagePath,
      required this.tabs});

  final articles = Article.articless;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiscoverController());
    final update = Get.put(signup_controller());
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            ArticleScreen.routeName,
            arguments: articles[tabs],
          );
        },
        child: Row(
          children: [
            Container(
                width: 80,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(File(imagePath)),
                )),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    judul,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            bool edit = true;
                            update.getIdDocument(id, deskripsi, judul, edit);
                            Get.toNamed("/profile");
                          },
                          icon: const Icon(Icons.edit)),
                      const SizedBox(width: 5),
                      const Text(
                        'Edit',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {
                            controller.deleteDocuments(id);
                          },
                          icon: Icon(Icons.delete)),
                      const SizedBox(width: 5),
                      const Text(
                        'Delete',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
