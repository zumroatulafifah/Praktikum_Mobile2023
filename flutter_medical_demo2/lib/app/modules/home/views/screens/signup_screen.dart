import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_demo1/app/modules/home/bindings/signup_binding.dart';
import 'package:flutter_medical_demo1/app/modules/home/controllers/signup_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<signup_controller> {
  //State<SignUpScreen> createState() => _SignUpScreenState();
  bool passToggle = true;
  final profileController = Get.lazyPut<signup_controller>(() =>
      signup_controller()); //buat mengikat controller dg view (signscreen)
  // var signupBinding = signup_screen_binding();

  var SignController = signup_controller
      .Signup_controller; //buat ngebaca all fungsi yg ada dlm controller nya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color((0xFF7165D6)),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Perbarui Profil',
          style: TextStyle(color: Colors.white),
        ),
        //backgroundColor: Colors.white,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    child: Obx(() {
                      if (SignController.imagePath.isNotEmpty) {
                        return ClipOval(
                          child: Image.file(
                            File(SignController.imagePath),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return const SizedBox(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/logo.jpg'),
                          ),
                        );
                      }
                    }),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 60,
                    right: 0,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.green,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 150,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Pilih Foto Profil',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            await SignController.openCamera();
                                            Get.back();
                                          },
                                          child: const Column(
                                            children: [
                                              Icon(Icons.camera),
                                              Text('Kamera'),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 40),
                                        InkWell(
                                          onTap: () {
                                            SignController.openGallery();
                                            Get.back();
                                          },
                                          child: const Column(
                                            children: [
                                              Icon(Icons.image),
                                              Text('Galeri'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: const Icon(Icons.camera_alt_rounded,
                              color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (passToggle == true) {
                          passToggle = false;
                        } else {
                          passToggle = true;
                        }
                        // setState(() {});
                      },
                      child: passToggle
                          ? const Icon(CupertinoIcons.eye_slash_fill)
                          : const Icon(CupertinoIcons.eye_fill),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF7165D6)),
              ),
              onPressed: () {
                SignController.saveProfile();
              },
              child: const Text('Simpan Profil'),
            ),
          ],
        ),
      ),
    );
  }
}

// class _SignUpScreenState extends State<SignUpScreen> {
  


//             SizedBox(height: 15),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: "Nama Lengkap",
//                   border: OutlineInputBorder(),
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//             ),
//             // Bagian UI lainnya.
//             // ...
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 saveProfile();
//               },
//               child: Text('Simpan Profil'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
