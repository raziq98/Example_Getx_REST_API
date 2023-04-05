import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/product.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  // list of cart items
  final List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;
  // add item to cart
  void addItemToCart(Product p) {
    _cartItems.add(p);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
