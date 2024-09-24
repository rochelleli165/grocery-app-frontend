import 'package:flutter/material.dart';
import 'package:grocery/requests/cart-model.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'pantry.dart';
import 'recipe.dart';
import 'package:grocery/requests/pantry-model.dart';
import 'package:grocery/requests/pantry-view-model.dart';

final cartView = CartView();

final pantryModel = PantryModel();
final pantryViewModel = PantryViewModel(PantryModel());

String user = "rochelleli165";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    pantryViewModel.getPantry(user);
    return MaterialApp(
        title: 'Grocery App',
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ChangeNotifierProvider(
          create: (context) => CartView(),
          child: MainPage(title: 'Home'),
        ));
  }
}

class PageModel with ChangeNotifier {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController textEditingController;
  final PageModel _pageModel = PageModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: _pageModel,
        builder: (context, child) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.food_bank),
                  label: 'Pantry',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt),
                  label: 'Recipes',
                ),
              ],
              currentIndex: _pageModel._selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _pageModel._onItemTapped,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListenableBuilder(
                  listenable: cartView,
                  builder: (context, child) {
                    if (_pageModel._selectedIndex == 0) {
                      return MyHomePage(title: "Home", cartView: cartView);
                    } else if (_pageModel._selectedIndex == 1) {
                      return PantryPage(title: "Pantry", cartView: cartView, pantryViewModel: pantryViewModel);
                    }
                    else {
                      return RecipePage(title: "Recipe", cartView: cartView, pantryViewModel: pantryViewModel);
                    }
                  }),
            ),
          );
        });
  }
}
