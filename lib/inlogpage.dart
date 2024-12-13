import 'package:flutter/material.dart';
import 'barcode.dart';

class Inlogpage extends StatefulWidget {
  @override
  _InlogpageState createState() => _InlogpageState();
}

class _InlogpageState extends State<Inlogpage> {
  final Barcode barcode = Barcode();

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Inlogpage",
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0), fontSize: 24),
          ),
          centerTitle: true,
        ),
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
                  Navigator.pushNamed(context, '/inloggenBarcode');
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
      ),
    );
  }
}
