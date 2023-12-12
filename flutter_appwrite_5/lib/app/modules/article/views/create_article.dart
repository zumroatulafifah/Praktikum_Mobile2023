import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_appwrite_5/app/modules/article/controllers/create_article_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CreateArticleView extends GetView<CreateArticleController> {
  const CreateArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Article'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Judul",
                  ),
                  keyboardType: TextInputType.text,
                  controller: controller.judulEditingController,
                  validator: (value) {
                    return controller.validateJudul(value!);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Penulis",
                  ),
                  keyboardType: TextInputType.text,
                  controller: controller.judulEditingController,
                  validator: (value) {
                    return controller.validatePenulis(value!);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => controller.imagePath.value == ''
                        ? const Text(
                            'Select Image from Gallery',
                            style: TextStyle(fontSize: 20),
                          )
                        : CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                FileImage(File(controller.imagePath.value)))),
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: (){
                        // controller.selectImage();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
