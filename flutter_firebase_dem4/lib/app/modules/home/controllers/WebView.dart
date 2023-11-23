import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class WebViewApp extends StatefulWidget {
//   const WebViewApp({Key? key}) : super(key: key);
//   static const routeName = '/webview';
//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }

// class _WebViewAppState extends State<WebViewApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView'),
//       ),
//       body: WebView(
//         initialUrl: 'https://github.com/zumroatulafifah',
//       ),
//     );
//   }
// }

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);
  static const routeName = '/webview';
  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebView(
        initialUrl: 'https://github.com/zumroatulafifah',
      ),
    );
  }
}
