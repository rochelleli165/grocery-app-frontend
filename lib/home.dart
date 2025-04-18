import 'package:flutter/material.dart';
import 'package:grocery/main.dart';
import 'package:grocery/requests/cart-model.dart';
import 'package:grocery/requests/subscriptions-model.dart';
import 'package:grocery/requests/subscriptions-view-model.dart';
import 'package:grocery/requests/store-model.dart';
import 'pantry.dart';
import 'package:provider/provider.dart';

final subscriptionsModel = SubscriptionsModel();
final subscriptionsViewModel = SubscriptionsViewModel(SubscriptionsModel());

String user = "rochelleli165";



const List<String> list = <String>['Store', 'Food'];

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.cartView});

  final String title;
  CartView cartView;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;

  final TextEditingController _controller = TextEditingController();

 static const List<String> _kOptions = <String>[
   
  ];
  @override
  Widget build(BuildContext context) {
    subscriptionsViewModel.getSubscriptions(user);
    String dropdownValue = list.first;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(16.0)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Current Sales',
              ),
            ),
            Row(
              children: [
                const Text('Sort by: '),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline:
                      Container(height: 2, color: Colors.deepPurpleAccent),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
            ListenableBuilder(
                listenable: subscriptionsViewModel,
                builder: (context, child) {
                  return getSubscriptionWidgets(
                      subscriptionsViewModel.subscriptions);
                }),
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
                              Text("Search for more supermarkets")
                            ]),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                      );
                    },
                  ),
                ),
              ),
            Text('Trends')
          ],
        ),
        
      ),
    );
  }

  Container AmountToggle(StoreData h, ItemData v) {
    return Container(
      child: ListenableBuilder(
          listenable: widget.cartView,
          builder: (BuildContext context, Widget? child) {
            CartView cartView = widget.cartView;
            if (cartView.cart.any((element) =>
                element.ingredient == v.ingredient &&
                element.store == h.storeName)) {
              CartItem cartItem = cartView.cart.firstWhere((element) =>
                  element.ingredient == v.ingredient &&
                  element.store == h.storeName);
              return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () =>
                        {cartView.decrement(v.ingredient, h.storeName)},
                    icon: Icon(Icons.remove, size: 16.0)),
                Text(
                  cartItem.amount.toString(),
                  softWrap: false,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    style: const ButtonStyle(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () =>
                        {cartView.increment(v.ingredient, h.storeName)},
                    icon: Icon(Icons.add, size: 16.0)),
              ]);
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      style: const ButtonStyle(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () =>
                          {cartView.increment(v.ingredient, h.storeName)},
                      icon: Icon(Icons.add, size: 16.0)),
                ],
              );
            }
          }),
    );
  }

  Table StoreTable(StoreData h) {
    return Table(
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: IntrinsicColumnWidth(),
          3: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: h.items
            .map((v) => TableRow(children: [
                  TableCell(
                    child: Container(
                        alignment: Alignment.center,
                        width: 25,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child:
                              Image.asset('assets/icons/${v.ingredient}.png'),
                        )),
                  ),
                  TableCell(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 90,
                      child: Text(
                        insertNewline(v.ingredient == 'vegetables' ? v.name : v.ingredient, 12),
                        softWrap: false,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                            v.price == '0.0'
                                ? ''
                                : double.parse(v.price).toStringAsFixed(2),
                            style: TextStyle(fontSize: 12.0)),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        insertNewline(v.sale, 16),
                        style: TextStyle(fontSize: 12.0),
                        softWrap: false,
                      ),
                    ),
                  ),
                  TableCell(child: AmountToggle(h, v)),
                ]))
            .toList());
  }

  String insertNewline(String input, int maxLength) {
    StringBuffer buffer = StringBuffer();
    int lastSpaceIndex = -1;
    int lineStart = 0;

    for (int i = 0; i < input.length; i++) {
      if (input[i] == ' ' || input[i]== '-') {
        lastSpaceIndex = i;
      }

      if (i - lineStart + 1 >= maxLength) {
        if (lastSpaceIndex > lineStart) {
          buffer.write(input.substring(lineStart, lastSpaceIndex));
          buffer.write('\n');
          lineStart = lastSpaceIndex + 1; // Start next line after space
        } else {
          // No space found, force a break at maxLength
          buffer.write(input.substring(lineStart, i + 1));
          buffer.write('\n');
          lineStart = i + 1;
        }
        lastSpaceIndex = -1;
      }
    }

    // Append remaining text
    if (lineStart < input.length) {
      buffer.write(input.substring(lineStart));
    }

    return buffer.toString();
  }

  Widget getSubscriptionWidgets(List<StoreData> subscriptions) {
    final ScrollController controller = ScrollController();
    final double height = MediaQuery.sizeOf(context).height;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: height / 2),
      child: CarouselView(
          //controller: controller,
          scrollDirection: Axis.horizontal,
          itemSnapping: true,
          itemExtent: height / 2,
          onTap: null,
          enableSplash: false,
          children: subscriptions
              .map((h) => Card(
                    child: SingleChildScrollView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.asset(
                                'assets/icons/${h.storeName.toLowerCase()}-logo.png',
                                fit: BoxFit.cover),
                            title: Text(
                              h.storeName,
                              softWrap: false,
                            ),
                            subtitle: Text(
                              insertNewline(h.storeAddress, 35),
                              softWrap: false,
                            ),
                          ),
                          StoreTable(h),
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}
