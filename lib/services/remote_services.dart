// ignore_for_file: avoid_init_to_null

import 'package:http/http.dart' as http;
import 'package:gtex_tutorial/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    List<Product>? data = null;
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return Future.value(data);
    }
  }
}
