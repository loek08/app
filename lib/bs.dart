import 'package:flutter/material.dart';
import 'barcode.dart';

class Test extends StatefulWidget {
  @override
  _Test createState() => _Test();
}

class _Test extends State<Test> {
  final Barcode barcode = Barcode();
  String scannedResult = 'niets gescanned';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 33, 33),
              ),
              child: Text(
                'menu',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Voeg producten toe'),
              onTap: () {
                Navigator.pushNamed(context, '/barcode');
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Verwijder producten'),
              onTap: () {
                Navigator.pushNamed(context, '/barcode2');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('add unkown barcode'),
              onTap: () {
                Navigator.pushNamed(context, '/addunknownbarcode');
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete known barcodes'),
              onTap: () {
                Navigator.pushNamed(context, '/deleteknownbarcode');
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Product lijst'),
              onTap: () {
                Navigator.pushNamed(context, '/list');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welkom bij de Barcode App test page!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Terug naar home'),
            ),
          ],
        ),
      ),
    );
  }
}
