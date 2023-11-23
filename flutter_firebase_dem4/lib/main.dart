import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/home/controllers/WebView.dart';
import 'package:newsapp/app/modules/home/controllers/auth_controller.dart';
import 'package:newsapp/app/modules/home/controllers/notification_handler.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/app/modules/home/views/login_page.dart.dart';
import 'package:newsapp/app/modules/home/views/homepage.dart';
import 'package:newsapp/app/modules/home/views/register_page.dart';
import 'package:newsapp/app/modules/home/views/article_screen.dart';
import 'package:newsapp/app/modules/home/views/discover_screen.dart';
import 'package:newsapp/app/modules/home/controllers/home_controllerAPI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  // await FirebaseMessagingHandler().initPushNotification();

  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // // Initialize Firebase Cloud Messaging
  // await messaging.requestPermission();

  // // Get the FCM token
  // String? token = await messaging.getToken().then((value) {
  //   print("FCM Token:$value");
  // });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
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
        GetPage(name: '/Home', page: () => homePage()),
        GetPage(name: '/discover', page: () => const DiscoverScreen()),
        GetPage(name: '/article', page: () => const ArticleScreen()),
        GetPage(name: '/api', page: () => HomeAPI()),
        GetPage(name: '/webview', page: () => const WebViewApp()),
      ],
    );
  }
}
