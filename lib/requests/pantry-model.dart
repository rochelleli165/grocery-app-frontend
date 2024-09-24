import 'package:http/http.dart' as http;
import 'dart:convert';

class PantryData {
  PantryData(this.pantryItems);

  final Map<String, int> pantryItems;
}

class PantryModel {
  Future<PantryData> getPantry(String user) async {
    String url = "http://127.0.0.1:5000/getPantryItems?var=$user";
    
     try {
        var resp = await http.get(Uri.parse(url));

        var raw_result = jsonDecode(resp.body);

        Map<String, int> result = {};
        
        raw_result.forEach((String k, v) => {
            result[k] = int.parse(v.toString())
          }
        );

        return PantryData(result); 

      } catch (e) {
        print('Error occurred: $e');
      }
      return PantryData({});
  }

  Future<void> addToPantry(String user, Map<String, int> items) async {
    String url = "http://127.0.0.1:5000/addToPantry";

    try {
      print('addToPantry model');
      var resp = await http.post(Uri.parse(url),
      headers: {
            'Content-Type': 'application/json',  // Ensure the correct header
          },
          body: jsonEncode({  // JSON encode the body
            'ingredients': items,
            'id': user
          }),
      );
      print(resp.statusCode);
    } catch (e) {
        print('Error occurred: $e');
      }
      return;
  }
}

