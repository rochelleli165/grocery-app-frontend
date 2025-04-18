import 'package:http/http.dart' as http;
import 'dart:convert';
import 'store-model.dart';

import 'package:grpc/grpc.dart';
import '/src/generated/user_feed_service.pbgrpc.dart';

class SubscriptionsData {
  SubscriptionsData(this.subscriptions);

  final List<StoreData> subscriptions;
}

class SubscriptionsModel {
  Future<SubscriptionsData> getUserSubscriptions(String user) async {
    print('hi');
    final channel = ClientChannel(
      'localhost', // or use the backend IP/host
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = UserFeedServiceClient(channel);

    try {
      final response = await stub.getUserAds(GetUserAdsRequest()..userId = 2);
      List<StoreData> stores = [];
      List<ItemData> items = [];
      for (int i = 0; i < response.ads.length; i++) {
        var ad = response.ads[i];
        items = mapItems(ad.adItems);
        stores.add(StoreData(ad.storeName, ad.storeAddress, items));
      }
      return sortSubscriptionData(
        SubscriptionsData(stores),
      );
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();

    
    return SubscriptionsData([]);
  }
}

SubscriptionsData sortSubscriptionData(SubscriptionsData data) {
  Map<String, int> ingredientTypeSortingList = {
    'Fruit': 1,
    'Vegetable': 2,
    'Meat': 3,
    'Dairy': 4,
    'Seafood': 5,
    'Baking': 6,
    'Deli': 7,
    'Condiments/Spices': 8,
    'Beverage': 9,
    'Frozen': 10,
    'Snack': 11,
    'Bakery': 12,
    'Other': 13,
  };
  List<StoreData> stores = data.subscriptions;
  for (int i = 0; i < stores.length; i++) {
    StoreData store = stores[i];
    List<ItemData> items = store.items;
    items.sort((a, b) {
      return ingredientTypeSortingList[a.ingredientType]!
          .compareTo(ingredientTypeSortingList[b.ingredientType]!);
    });
    stores[i] = StoreData(store.storeName, store.storeAddress, items);
  }
  return SubscriptionsData(stores);
}

List<ItemData> mapItems(List<AdItemData> raw_items) {
  List<ItemData> res = [];
  for (int i = 0; i < raw_items.length; i++) {
    AdItemData item = raw_items[i];
    res.add(ItemData(
        item.ingredient as String? ?? '',
        item.name as String? ?? '',
        item.price.toString() as String? ?? '',
        item.sale as String? ?? '',
        0, item.ingredientType));
  }
  return res;
}
