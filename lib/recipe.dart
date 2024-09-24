import 'package:flutter/material.dart';
import 'package:grocery/requests/cart-model.dart';
import 'package:grocery/requests/pantry-model.dart';
import 'package:grocery/requests/pantry-view-model.dart';
import 'package:grocery/requests/recipe-model.dart';
import 'package:grocery/requests/recipe-view-model.dart';
import 'main.dart';
import 'package:provider/provider.dart';

String user = "rochelleli165";

final pantryModel = PantryModel();
final pantryViewModel = PantryViewModel(PantryModel());

final recipeModel = RecipeModel();
final recipeViewModel = RecipeViewModel(RecipeModel());

class RecipePage extends StatefulWidget {
  RecipePage({super.key, required this.title, required this.cartView, required this.pantryViewModel});

  final String title;
  CartView cartView;
  PantryViewModel pantryViewModel;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  late TextEditingController textEditingController;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pantryViewModel.getPantry(user);
    print((widget.cartView.cart).length);
    return Scaffold(
  
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(16.0)),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.book),
                    Text('Find Recipes'),
                  ],
                ),
              ),
              Checkbox(value: false, onChanged: (bool) => {}),
              ElevatedButton(onPressed: () => recipeViewModel.getRecipes(getIngredients(true)), child: Text('Find Recipes')),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text('Add to Pantry'),
                    onPressed: () {
                      pantryViewModel.addToPantry(user, widget.cartView);
                      cartView.clear();
                    },
                  ),
                ],
              ),
              Text("Recipes"),
              ListenableBuilder(
                  listenable: recipeViewModel,
                  builder: (context, child) {
                    return SingleChildScrollView(
                      child: Column(
                          children: recipeViewModel.recipes
                              .map((e) => Text('${e.recipeName}'))
                              .toList()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Map<String,int> getIngredients(includeCart) {
    Map<String, int> ret = {};
    ret.addAll(widget.pantryViewModel.pantryItems);
    if (includeCart) {
      for (CartItem i in widget.cartView.cart) {
        ret[i.ingredient] = i.amount;
      }
    }
    return ret;
  }
}
