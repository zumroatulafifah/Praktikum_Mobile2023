import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/modules/home/controllers/WebView.dart';
import 'package:newsapp/app/modules/home/controllers/auth_controller.dart';
import 'package:newsapp/app/modules/home/controllers/notification_handler.dart';
import 'package:newsapp/app/modules/home/views/login_page.dart.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/app/modules/home/views/homepage.dart';
import 'package:newsapp/app/modules/home/views/register_page.dart';
import 'package:newsapp/app/modules/home/views/article_screen.dart';
import 'package:newsapp/app/modules/home/views/discover_screen.dart';
import 'package:newsapp/app/modules/home/controllers/home_controllerAPI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize SharedPreferences
  await Get.putAsync(() async => await SharedPreferences.getInstance());

  // Initialize Firebase Cloud Messaging
  await FirebaseMessagingHandler().initPushNotification();

  // Get the messaging instance
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request permission for notifications
  await messaging.requestPermission();

  // VAPID key for web (replace with your actual VAPID key)
  const vapidKey =
      "BGKx_D1LrOIJBEGwBukQqzWZLCRoVs-BxPe-m5-hO3oXLk6qvV2tY8zZaXPIUTDvmkPjo5b-PNZuzdCjCMz_5NM";

  // Get FCM token
  String? token;

  if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
    // For web platform, use VAPID key
    token = await messaging.getToken(vapidKey: vapidKey);
  } else {
    // For other platforms (iOS, Android), use default method
    token = await messaging.getToken();
  }


  // Print the FCM token in debug mode
  if (kDebugMode) {
    print('Registration Token: $token');
  }

  // Run the app
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
        GetPage(name: '/Home', page: () => homePage()),
        GetPage(name: '/discover', page: () => const DiscoverScreen()),
        GetPage(name: '/article', page: () => const ArticleScreen()),
        GetPage(name: '/api', page: () => HomeAPI()),
        GetPage(name: '/webview', page: () => const WebViewApp()),
      ],
    );
  }
}
