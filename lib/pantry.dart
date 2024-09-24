import 'package:flutter/material.dart';
import 'package:grocery/requests/cart-model.dart';
import 'package:grocery/requests/pantry-view-model.dart';
import 'package:grocery/requests/recipe-model.dart';
import 'main.dart';
import 'package:provider/provider.dart';

String user = "rochelleli165";



final recipeModel = RecipeModel();

class PantryPage extends StatefulWidget {
  PantryPage({super.key, required this.title, required this.cartView, required this.pantryViewModel});

  final String title;
  CartView cartView;
  final PantryViewModel pantryViewModel;

  @override
  State<PantryPage> createState() => _PantryPageState();
}

class _PantryPageState extends State<PantryPage> {
  late TextEditingController textEditingController;

  final TextEditingController _controller = TextEditingController();

  static const List<String> _kOptions = <String>[
    "soy-sauce",
    "water",
    "cabbage",
    "black-pepper",
    "carrot",
    "chicken-thigh",
    "green-onion",
    "katsuobushi",
    "mentsuyu",
    "oil",
    "onion",
    "udon",
    "toppings",
    "mirin",
    "sugar",
    "dashi",
    "salt"
  ];

  @override
  Widget build(BuildContext context) {
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
                    Icon(Icons.shopping_cart),
                    Text('Cart'),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0)),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(179, 200, 194, 194),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return _kOptions.where((String option) {
                        return option
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (String selection) {
                      widget.cartView.increment(selection, "None");
                      textEditingController.text = "";
                    },
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      textEditingController = fieldTextEditingController;
                      return TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                  width: 0,
                                  color: Color.fromARGB(179, 200, 194, 194)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                  width: 0.0,
                                  color: Color.fromARGB(179, 200, 194, 194)),
                            ),
                            label: Row(children: [
                              Icon(Icons.search),
                              Text("Search for more foods")
                            ]),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      );
                    },
                  ),
                ),
              ),
              ListenableBuilder(
                  listenable: cartView,
                  builder: (BuildContext context, Widget? child) {
                    CartView cartView = widget.cartView;
                    return Wrap(
                        direction: Axis.horizontal,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: cartView.cart
                            .map((CartItem c) => Card(
                                    child: IntrinsicWidth(
                                  child: Row(children: [
                                    Padding(padding: const EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),),
                                    Text('${c.ingredient} ${c.amount}'),
                                    IconButton(
                                        padding: EdgeInsets.all(8.0),
                                        style: const ButtonStyle(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () => {
                                              cartView.decrement(
                                                  c.ingredient, c.store)
                                            },
                                        icon: Icon(Icons.close, size: 16.0))
                                  ]),
                                )))
                            .toList());
                  }),
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
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Current Pantry Ingredients")),
              Align(
                alignment: Alignment.centerLeft,
                child:
              ListenableBuilder(
                  listenable: pantryViewModel,
                  builder: (context, child) {
                    return SingleChildScrollView(
                      child: Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: IntrinsicColumnWidth(),
                            1: IntrinsicColumnWidth(),
                            2: IntrinsicColumnWidth(),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: pantryViewModel.pantryItems.entries
                              .map((e) => TableRow(children: [
                                    TableCell(child: Text(e.key)),
                                    TableCell(child: Text(e.value.toString()))
                                  ]))
                              .toList()),
                    );
                  }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getRecipes() {
    // pantryCart.addAll(pantryViewModel.pantryItems.keys);
    // recipeModel.getRecipes(pantryCart);
  }
}
