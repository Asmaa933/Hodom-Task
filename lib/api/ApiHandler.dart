import 'dart:async';
import 'dart:convert' as convert;

import 'package:hodom_task/models/LoginModel.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  Future<LoginModel> checkAuth(String phone, String password) async {
    final http.Response response = await http.post(
      'http://hodom.innsandbox.com/api/login',
      body: convert
          .jsonEncode(<String, String>{'phone': phone, 'password': password}),
    );
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      throw Exception('Failed to login.');
    }
  }
}
