import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/modules/home/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/modules/home/views/login_page.dart';
import 'package:flutter_firebase/app/modules/home/controllers/notification_hadler.dart';
import 'package:flutter_firebase/app/modules/home/views/register_page.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await FirebaseMessagingHandler().initPushNotification();
  await FirebaseMessagingHandler().initLocalNotification();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create an instance of AuthController
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: _authController.isLoggedIn.value ? '/Home' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        // GetPage(name: '/Home', page: () => homePage()),
        // GetPage(name: '/discover', page: () => const DiscoverScreen()),
        // GetPage(name: '/article', page: () => const ArticleScreen()),
        // GetPage(name: '/api', page: () => HomeAPI()),
        // GetPage(name: '/webview', page: () => const WebViewApp()),
      ],
    );
  }
}
