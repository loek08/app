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


  void scanAndAddQuantity() async {
    try {
      var result = await BarcodeScanner.scan(); // Scan de barcode
      String barcodeKey = result.rawContent;

      if (barcodeKey.isNotEmpty) {
        // Controleer of barcode bekend is
        if (barcode.productDatabase.containsKey(barcodeKey)) {
          // Haal ingevoerde hoeveelheid op
          int quantity = int.tryParse(_quantityController.text) ?? 0;

          if (quantity > 0) {
            // Voeg het aantal toe aan de database
            setState(() {
              barcode.productDatabase[barcodeKey]!['quantity'] += quantity;
              barcode.saveDatabase(); // Sla op in shared_preferences

              scannedResult =
              "Aantal toegevoegd: ${barcode.productDatabase[barcodeKey]!['name']} - Nieuw aantal: ${barcode.productDatabase[barcodeKey]!['quantity']}";
              _quantityController.clear(); // Leeg het invoerveld
            });
          } else {
            setState(() {
              scannedResult = "Fout: voer een geldig aantal in";
            });
          }
        } else {
          setState(() {
            scannedResult = "Onbekende barcode: ${barcodeKey}";
          });
        }
      } else {
        setState(() {
          scannedResult = "Fout: geen barcode gescand";
        });
      }
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
              onPressed: scanAndAddQuantity,
              child: Text('Aantal toevoegen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Terug naar home'),
            ),
          ],
        ),
      ),
    );
  }
}
