import 'storage.dart';

class Barcode {
  Map<String, Map<String, dynamic>> productDatabase = {
    '20437169': {'name': 'Saskia vtmn drnk lime-lychee', 'quantity': 0},
    '0123456789': {'name': 'ok', 'quantity': 0},
  };

  Barcode() {
    loadDatabase();
  }

  Future<void> loadDatabase() async {
    Map<String, Map<String, dynamic>> loadedDatabase =
        await StorageHelper.loadProductDatabase();
    if (loadedDatabase.isNotEmpty) {
      productDatabase = loadedDatabase;
    }
  }

  Map<String, Map<String, dynamic>> getProductDatabase() {
    return productDatabase;
  }

  void increaseQuantity(String barcode) {
    if (productDatabase.containsKey(barcode)) {
      productDatabase[barcode]!['quantity']++;
      saveDatabase();
    }
  }

  void decreaseQuantity(String barcode) {
    if (productDatabase.containsKey(barcode) &&
        productDatabase[barcode]!['quantity'] > 0) {
      productDatabase[barcode]!['quantity']--;
      saveDatabase();
    }
  }

  void removeProduct(String barcode) {
    if (productDatabase.containsKey(barcode)) {
      productDatabase.remove(barcode);
      saveDatabase();
    }
  }

  void saveDatabase() {
    StorageHelper.saveProductDatabase(productDatabase);
  }
}
