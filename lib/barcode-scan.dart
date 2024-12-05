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

  Future<void> scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();

      setState(() {
        // Controleer eerst of er daadwerkelijk een barcode is gescand
        if (result.rawContent.isNotEmpty) {
          // Kijk of de gescande barcode in de productDatabase zit
          if (barcode.productDatabase.containsKey(result.rawContent)) {
            barcode.increaseQuantity(result.rawContent);
            scannedResult =
                "Product gevonden: ${barcode.getProductDatabase()[result.rawContent]!['name']} - Aantal: ${barcode.productDatabase[result.rawContent]!['quantity']}";
          } else {
            // Barcode is gescand maar niet in de database
            scannedResult = "Onbekende barcode: ${result.rawContent}";
          }
        } else {
          // Geen barcode gescand
          scannedResult = "Geen product gescand";
        }
      });
    } catch (e) {
      setState(() {
        scannedResult = "Fout bij scannen: $e";
      });
    }
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
