import 'package:flutter/material.dart';
import 'barcode.dart';
import 'webview_page.dart';

class Home_klant extends StatelessWidget {
  final Barcode barcode = Barcode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Website in App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewPage(), // Dit opent direct de WebView-pagina
    );
  }
}
