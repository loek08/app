import 'package:flutter/material.dart';
import 'barcode.dart';

class Home extends StatelessWidget {
  final Barcode barcode = Barcode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: FutureBuilder<Map<String, Map<String, dynamic>>>(
        future: Future.value(barcode.getProductDatabase()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Geen producten gevonden"));
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/barcode');
                  },
                  child: Text("Voeg producten toe"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/barcode2');
                  },
                  child: Text("Verwijder producten"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addunknownbarcode');
                  },
                  child: Text("add unkown barcode"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/deleteknownbarcode');
                  },
                  child: Text("delete known barcode"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: Text("barcode list"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
