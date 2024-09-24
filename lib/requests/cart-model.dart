import 'package:flutter/material.dart';

class CartItem {
  CartItem(this.ingredient, this.amount, this.store);
  String store;
  String ingredient;
  int amount;
}

class CartView extends ChangeNotifier {
  List<CartItem> cart = [];
  CartView();

  void increment(String ingredient, String store) {
    if (cart.any((item) => item.ingredient == ingredient && item.store == store)){
      CartItem item = cart.firstWhere((item) => item.ingredient == ingredient && item.store == store);
      item.amount += 1;
    }
    else {
      cart.add(CartItem(ingredient, 1, store));
    }
    
    notifyListeners();
  }

  void decrement(String ingredient, String store) {
    CartItem item = cart.firstWhere((item) => item.ingredient == ingredient && item.store == store);
    item.amount -= 1;

    if (item.amount == 0) {
      cart.removeWhere((item) => item.ingredient == ingredient && item.store == store);
    }
    notifyListeners();
  }

  void clear() {
    cart = [];
    notifyListeners();
  }
}