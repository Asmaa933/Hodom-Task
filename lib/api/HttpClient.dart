import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  Future checkAuth(String phone, String password) async {
    http.Response response = await http.post(
      'http://hodom.innsandbox.com/api/login',
      body: jsonEncode(<String, String>{
        'phone': phone,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
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
