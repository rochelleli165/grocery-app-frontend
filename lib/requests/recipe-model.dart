import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cart-model.dart';

class RecipeData {
  RecipeData(this.recipes);

  final List<Recipe> recipes;
}

class RecipeModel {
  Future<RecipeData> getRecipes(Map<String, int> pantryIngredients) async {
    String url = "http://127.0.0.1:5000/getRecipes";


    print(pantryIngredients);
     try {
        var resp = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',  // Ensure the correct header
          },
          body: jsonEncode({  // JSON encode the body
            'ingredients': pantryIngredients
          }),
        );

        var raw_result = jsonDecode(resp.body);

        List<Recipe> result = [];
        raw_result.forEach((r) => {
          result.add(Recipe(r.toString()))
        });

        return RecipeData(result); 

      } catch (e) {
        print('Error occurred: $e');
      }
      return RecipeData([]);
  }
}
  


class Recipe {
  Recipe(this.recipeName);
  final String recipeName;
  // final String[] recipeIngredients;
  // final String recipeLink;
  // final String recipeAuthor;
}