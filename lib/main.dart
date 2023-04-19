import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse('https://daryo.uz/'));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Center(
              child: Text("Fayzullo's Website")),
        ),
        body:WebViewWidget(controller: controller,
        ),
        bottomNavigationBar: Container(
          color: Colors.blue[400],
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20,right: 20),
            child: ButtonBar(
              children: [
                navigationButton(Icons.chevron_left, () {}),
                navigationButton(Icons.chevron_right, () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget navigationButton(IconData icon, Function() onPressed){
    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}

