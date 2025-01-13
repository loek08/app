import 'package:flutter/material.dart';
import 'barcode-scan.dart';
import 'home_personeel.dart';
import 'barcode-scan en aantal -1.dart';
import "add_unknown_barcode.dart";
import 'delete_known_barcode.dart';
import 'barcode_list.dart';
import 'bs.dart';
import 'inlogpage.dart';
import 'apppage_klanten.dart';
import 'inloggenBarcode.dart';
import 'webview_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'barcode scan',
        initialRoute: '/inlog',
        onGenerateRoute: (settings) {
          if (settings.name == '/inlog') {
            return MaterialPageRoute(
              builder: (context) {
                return Inlogpage();
              },
              settings: RouteSettings(name: '/inlog'),
              maintainState: false,
            );
          }
          return null;
        },
        routes: {
          '/inlog': (context) => Inlogpage(),
          '/': (context) => Home(),
          '/barcode': (context) => BarcodeScannerPage(),
          '/barcode2': (context) => BarcodeScannerPage2(),
          '/addunknownbarcode': (context) => AddUnknownBarcodePage(),
          '/deleteknownbarcode': (context) => DeleteKnownBarcodePage(),
          '/list': (context) => BarcodeListPage(),
          '/bss': (context) => Test(),
          '/klant': (context) => Home_klant(),
          '/inloggenBarcode': (context) => InloggenBarcode(),
          '/webview': (context) => WebViewPage(),
        });
  }
}
