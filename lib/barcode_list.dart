import 'package:flutter/material.dart';
import 'barcode.dart';

class BarcodeListPage extends StatefulWidget {
  @override
  _BarcodeListPageState createState() => _BarcodeListPageState();
}

class _BarcodeListPageState extends State<BarcodeListPage> {
  final Barcode barcode = Barcode();

  @override
  void initState() {
    super.initState();
    barcode.loadDatabase().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete known barcodes'),
      ),
      body: ListView.builder(
        itemCount: barcode.productDatabase.length,
        itemBuilder: (context, index) {
          String key = barcode.productDatabase.keys.toList()[index];
          return ListTile(
            title: Text(barcode.productDatabase[key]!['name']),
            subtitle:
                Text("Aantal: ${barcode.productDatabase[key]!['quantity']}"),
          );
        },
      ),
    );
  }
}
