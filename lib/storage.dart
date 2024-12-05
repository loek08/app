import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageHelper {
  static Future<void> saveProductDatabase(
      Map<String, Map<String, dynamic>> productDatabase) async {
    final prefs = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(productDatabase);
    await prefs.setString('product_database', jsonString);
  }

  static Future<Map<String, Map<String, dynamic>>> loadProductDatabase() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('product_database');
    if (jsonString != null) {
      Map<String, Map<String, dynamic>> loadedDatabase =
          Map<String, Map<String, dynamic>>.from(jsonDecode(jsonString));
      return loadedDatabase;
    }
    return {};
  }
}
