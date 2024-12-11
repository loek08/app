import 'package:flutter/material.dart';
import 'barcode.dart';

class Home_klant extends StatelessWidget {
  final Barcode barcode = Barcode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home klant",
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
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('uitloggen'),
              onTap: () {
                Navigator.pushNamed(context, '/inlog');
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
              'Welkom bij de bestel app!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
