import './subscriptions-model.dart';
import 'package:flutter/foundation.dart';
import 'store-model.dart';

class SubscriptionsViewModel extends ChangeNotifier {
  final SubscriptionsModel model;
  List<StoreData> subscriptions = [];
  String? errorMessage;
  SubscriptionsViewModel(this.model);

  Future<void> getSubscriptions(user) async {
    try {
      subscriptions = (await model.getUserSubscriptions(user)).subscriptions;
      print(subscriptions);
    } catch (e) {
      errorMessage = 'Could not initialize counter';
    }
    notifyListeners();
  }
}