import './pantry-model.dart';
import 'package:flutter/foundation.dart';
import 'store-model.dart';
import './cart-model.dart';

class PantryViewModel extends ChangeNotifier {
  final PantryModel model;
  Map<String, int> pantryItems = {};
  String? errorMessage;
  PantryViewModel(this.model);

  Future<void> getPantry(user) async {
    try {
      pantryItems = (await model.getPantry(user)).pantryItems;

    } catch (e) {
      errorMessage = 'Could not initialize counter';
    }
    notifyListeners();
  }

  Future<void> addToPantry(user, CartView ingredients) async {
    Map<String, int> i = {};
    for (CartItem c in ingredients.cart) {
      i[c.ingredient] = c.amount;
    }
    try {
      print('add view model');
      await model.addToPantry(user, i);
    } catch (e) {
      errorMessage = 'Failure to add to pantry: $e';
      print(errorMessage);
    }
    getPantry(user);
  }

}