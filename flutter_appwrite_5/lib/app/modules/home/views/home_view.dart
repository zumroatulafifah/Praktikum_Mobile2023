import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(
            onPressed: () {
              // controller.logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(child: Text('HomeView'),),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),
      onPressed: () {
        controller.moveToCreateJudul();
      },),
    );
  }
}
