import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/home/controllers/home_controllerAPI.dart';
import 'package:newsapp/app/modules/home/views/home_screen.dart';
import 'package:newsapp/app/modules/home/controllers/auth_controller.dart';
import 'package:newsapp/app/modules/home/views/homepage.dart';
import 'register_page.dart'; // Import the RegisterPage
// import 'home_page.dart'; // Import the HomePage or replace it with your desired page

class LoginPage extends StatefulWidget {
  static const routeName = '/';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.put(AuthController());
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
                        Get.off(() => homePage());
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
          ],
        ),
      ),
    );
  }
}
