import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHandler {
  Future checkAuth(String phone, String password) async {
    http.Response response = await http.post(
      'http://hodom.innsandbox.com/api/login',
      body: jsonEncode(<String, String>{
        'phone': phone,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
