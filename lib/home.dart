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

  @override
  Widget build(BuildContext context) {
    subscriptionsViewModel.getSubscriptions(user);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(16.0)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Subscribed Stores',
              ),
            ),
            ListenableBuilder(
                listenable: subscriptionsViewModel,
                builder: (context, child) {
                  return getSubscriptionWidgets(
                      subscriptionsViewModel.subscriptions);
                }),
          ],
        ),
      ),
    );
  }

  Container AmountToggle(StoreData h, ItemData v) {
    return Container(
      height: 40,
      width: 130,
      child:  ListenableBuilder(
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
              Text(cartItem.amount.toString()),
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
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: h.items
            .map((v) => TableRow(children: [
                  TableCell(
                    child: Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(v.ingredient),
                        )),
                  ),
                  TableCell(
                    child: Container(
                        height: 40,
                        width: 50,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(v.price, style: TextStyle(fontSize: 12.0)),
                        )),
                  ),
                  TableCell(
                    child: Container(
                        height: 40,
                        width: 105,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(v.sale, style: TextStyle(fontSize: 12.0),),
                        )),
                  ),
                  TableCell(
                      
                      child: AmountToggle(h, v)),
                ]))
            .toList());
  }

  Widget getSubscriptionWidgets(Map<String, StoreData> subscriptions) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: subscriptions.values
            .map((h) => Card(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.house),
                      title: Text(h.storeName),
                      subtitle: Text(h.storeAddress),
                    ),
                    Container(
                      height: 300,
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: StoreTable(h),
                      ),
                    )
                  ],
                )))
            .toList());
  }
}
