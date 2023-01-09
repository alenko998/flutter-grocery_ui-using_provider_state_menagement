import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items
  final List _shopItems = [
    ["Avocado", "4.00", "lib/images/avocado.png", Colors.green[600]],
    ["Banana", "2.50", "lib/images/banana.png", Colors.yellow[100]],
    ["Chicken", "12.00", "lib/images/chicken.png", Colors.brown[100]],
    ["Water", "1.00", "lib/images/water.png", Colors.blue[100]],
  ];
  get shopItems => _shopItems;

  // list of cart item
  final List _cartItems = [];

  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total
  String calculate() {
    double price = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      price += double.parse(_cartItems[i][1]);
    }
    return price.toString();
  }
}
