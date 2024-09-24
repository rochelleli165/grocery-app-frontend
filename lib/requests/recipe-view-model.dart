import './recipe-model.dart';
import 'package:flutter/foundation.dart';
import 'store-model.dart';
import './cart-model.dart';

class RecipeViewModel extends ChangeNotifier {
  final RecipeModel model;
  List<Recipe> recipes = [];
  String? errorMessage;
  RecipeViewModel(this.model);

  Future<void> getRecipes(pantryIngredients) async {
    try {
      recipes = (await model.getRecipes(pantryIngredients)).recipes;

    } catch (e) {
      errorMessage = 'Could not initialize counter';
    }
    notifyListeners();
  }

}