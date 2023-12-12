import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/modules/Appwrite/Controllers/database_controller.dart';
import 'package:flutter_firebase/app/modules/Login/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/modules/Login/views/home_page.dart';
import 'package:flutter_firebase/app/modules/News/views/home_controllerAPI.dart';
import 'package:get/get.dart';
import 'register_page.dart'; // Import the RegisterPage
// import 'home_page.dart'; // Import the HomePage or replace it with your desired page

class LoginPage extends StatefulWidget {
  static const routeName = '/';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.put(AuthController());
  final DatabaseController _databaseController = Get.put(DatabaseController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                        _authController.loginUser(
                          _emailController.text,
                          _passwordController.text,
                        );

                        // Navigate to the HomePage or your desired page
                        Get.off(() => HomePage());
                      },
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Login'),
              );
            }),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to the RegisterPage using Get.to
                Get.to(() => RegisterPage());
              },
              child: Text('Register'),
            ),
            // FutureBuilder(
            //   future: _databaseController.storage?.getFileView(
            //       bucketId: "6568a566bad7dbc1b491",
            //       fileId: "6568a59328800144c40d"),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Image(image: MemoryImage(snapshot.requireData));
            //     }
            //     return Text("Gagal mengambil gambar");
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
