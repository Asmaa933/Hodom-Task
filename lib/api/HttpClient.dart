import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  Future<dynamic> checkAuth(String phone, String password) async {
    http.Response response = await http.post(
      'http://hodom.innsandbox.com/api/login',
      body: jsonEncode(<String, String>{
        'phone': phone,
        'password': password,
      }),
    );
    // 2 different response
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse[0]['status'] == 200) {
        return jsonResponse[0];
      } else {
        return (jsonResponse[0]['status']);
      }
    } else {
      print(response.statusCode);
    }
  }

  Future<List<dynamic>> getAllCategories() async {
    var response =
        await http.get('http://hodom.innsandbox.com/api/list/categories');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonResponseResult = jsonResponse[0]['result'];
      return jsonResponseResult;
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
