import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'barcode.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final Barcode barcode = Barcode();
  String scannedResult = 'niets gescanned';
  final TextEditingController _quantityController = TextEditingController();
  bool showQuantityInput = false;

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();

      setState(() {
        // Controleer eerst of er daadwerkelijk een barcode is gescand
        if (result.rawContent.isNotEmpty) {
          // Kijk of de gescande barcode in de productDatabase zit
          if (barcode.productDatabase.containsKey(result.rawContent)) {
            scannedResult =
                "Product gevonden: ${barcode.getProductDatabase()[result.rawContent]!['name']} - Aantal: ${barcode.productDatabase[result.rawContent]!['quantity']}";
            showQuantityInput = true;
          } else {
            // Barcode is gescand maar niet in de database
            scannedResult = "Onbekende barcode: ${result.rawContent}";
            showQuantityInput = false;
          }
        } else {
          // Geen barcode gescand
          scannedResult = "Geen product gescand";
          showQuantityInput = false;
        }
      });
    } catch (e) {
      setState(() {
        scannedResult = "Fout bij scannen: $e";
        showQuantityInput = false;
      });
    }
  }

  void addQuantity(String barcodeKey, int quantity) {
    for (int i = 0; i < quantity; i++) {
      barcode.increaseQuantity(barcodeKey);
    }
    setState(() {
      scannedResult =
          "Aantal toegevoegd: ${barcode.productDatabase[barcodeKey]!['quantity']}";
      showQuantityInput = false;
    });
    barcode.saveDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              scannedResult,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scan barcode'),
            ),
            if (showQuantityInput) ...[
              SizedBox(height: 20),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Voer het aantal in',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_quantityController.text.isNotEmpty) {
                    int quantity = int.parse(_quantityController.text);
                    addQuantity(scannedResult.split(": ")[1], quantity);
                  }
                },
                child: Text('Aantal Toevoegen'),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Terug naar home'),
            )
          ],
        ),
      ),
    );
  }
}
