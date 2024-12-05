import 'package:flutter/material.dart';
import 'barcode.dart';

class DeleteKnownBarcodePage extends StatefulWidget {
  @override
  _DeleteKnownBarcodePageState createState() => _DeleteKnownBarcodePageState();
}

class _DeleteKnownBarcodePageState extends State<DeleteKnownBarcodePage> {
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
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  barcode.removeProduct(key);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
