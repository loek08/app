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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'barcode scan', initialRoute: '/inlog', routes: {
      '/': (context) => Home(),
      '/barcode': (context) => BarcodeScannerPage(),
      '/barcode2': (context) => BarcodeScannerPage2(),
      '/addunknownbarcode': (context) => AddUnknownBarcodePage(),
      '/deleteknownbarcode': (context) => DeleteKnownBarcodePage(),
      '/list': (context) => BarcodeListPage(),
      '/bs': (context) => Test(),
      '/inlog': (context) => Inlogpage(),
      '/klant': (context) => Home_klant(),
    });
  }
}
