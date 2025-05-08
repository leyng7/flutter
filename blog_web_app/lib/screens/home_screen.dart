import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..loadRequest(Uri.parse('https://blog.codefactory.ai'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          print(url)
        }
      ))
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Code Factory'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                webViewController.loadRequest(Uri.parse('https://blog.codefactory.ai'));
              },
              icon: Icon(Icons.home)
          ),
        ],
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
