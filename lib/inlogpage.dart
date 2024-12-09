import 'package:flutter/material.dart';
import 'barcode.dart';

class Inlogpage extends StatefulWidget {
  @override
  _InlogpageState createState() => _InlogpageState();
}

class _InlogpageState extends State<Inlogpage> {
  final Barcode barcode = Barcode();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inlogpage",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
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
              'Welkom bij de inlog page!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Naar personeel pagina'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/klant');
              },
              child: Text('Naar klant pagina'),
            ),
          ],
        ),
      ),
    );
  }
}
