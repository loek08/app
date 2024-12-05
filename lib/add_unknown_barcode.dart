import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'barcode.dart';

class AddUnknownBarcodePage extends StatefulWidget {
  @override
  _AddUnknownBarcodePageState createState() => _AddUnknownBarcodePageState();
}

class _AddUnknownBarcodePageState extends State<AddUnknownBarcodePage> {
  final Barcode barcode = Barcode();
  String scannedBarcode = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() {
        scannedBarcode = result.rawContent;
      });
    } catch (e) {
      setState(() {
        scannedBarcode = 'Fout bij scannen: $e';
      });
    }
  }

  void addProduct() {
    String name = nameController.text;
    int quantity = int.tryParse(quantityController.text) ?? 0;

    if (scannedBarcode.isNotEmpty && name.isNotEmpty) {
      barcode.productDatabase[scannedBarcode] = {
        'name': name,
        'quantity': quantity
      };
      barcode.saveDatabase(); // Opslaan naar shared_preferences

      // Terug naar Home
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onbekend product toevoegen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scan barcode'),
            ),
            SizedBox(height: 20),
            if (scannedBarcode.isNotEmpty)
              Text(
                'Gescannde barcode: $scannedBarcode',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Productnaam',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Aantal',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              child: Text('Product toevoegen'),
            ),
          ],
        ),
      ),
    );
  }
}
