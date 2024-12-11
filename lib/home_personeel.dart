import 'package:flutter/material.dart';
import 'barcode.dart';

class Home extends StatelessWidget {
  final Barcode barcode = Barcode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0), fontSize: 24),
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
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('uitloggen'),
              onTap: () {
                Navigator.pushNamed(context, '/inlog');
              },
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
      // body: Center(
      //   child: Text(
      //     'Welkom bij de Barcode App!',
      //     style: TextStyle(fontSize: 24),
      //   ),

      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welkom bij de Barcode App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bs');
              },
              child: Text('Naar test page'),
            )
          ],
        ),
      ),
    );
  }
}
