import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'model/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  CartProvider() {
    loadCartFromPreferences(); // Load cart from SharedPreferences on initialization
  }

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
    saveCartToPreferences();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
    saveCartToPreferences();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
    saveCartToPreferences();
  }

  // Save cart to SharedPreferences
  Future<void> saveCartToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStrings = _cartItems.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('cartItems', cartStrings);
  }

  // Load cart from SharedPreferences
  Future<void> loadCartFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartStrings = prefs.getStringList('cartItems');
    if (cartStrings != null) {
      _cartItems = cartStrings.map((item) => Product.fromJson(jsonDecode(item))).toList();
      notifyListeners();
    }
  }
}
