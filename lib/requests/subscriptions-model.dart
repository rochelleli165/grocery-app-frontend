import 'package:http/http.dart' as http;
import 'dart:convert';
import 'store-model.dart';

class SubscriptionsData {
  SubscriptionsData(this.subscriptions);

  final Map<String, StoreData> subscriptions;
}

class SubscriptionsModel {
  Future<SubscriptionsData> getUserSubscriptions(String user) async {
    String url = "http://127.0.0.1:5000/getSubscriptions?var=$user";
    
     try {
        var resp = await http.get(Uri.parse(url));

        var raw_result = jsonDecode(resp.body);

        Map<String, StoreData> result = {};
        
        raw_result.forEach((k,v) => result[k] = StoreData(
          v['store-name'],
          v['store-address'],
          mapItems(v['items']['items']),
        ));

        return SubscriptionsData(result); 

      } catch (e) {
        print('Error occurred: $e');
      }
      return SubscriptionsData({});
  }
}

List<ItemData> mapItems(List<dynamic> raw_items) {
  List<ItemData> res = [];
  for(int i  = 0; i < raw_items.length; i++) {
    dynamic item = raw_items[i];
    res.add(ItemData(item['deal'], item['ingredient'], item['name'], item['price'], item['sale'], 0));
  }
  return res;
}