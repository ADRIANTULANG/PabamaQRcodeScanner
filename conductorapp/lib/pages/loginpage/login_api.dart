import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:conductorapp/helpers/endpoints.dart';
import 'package:conductorapp/pages/loginpage/login_model.dart';

class LoginApi {
// Future<List<StoreDetailsModel>>
  static Future<List<User>> loginApi({
    required String username,
    required String password,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/login-user-conductor.php"),
        body: {
          "username": username.toString(),
          "password": password.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('loginApi code ${response.statusCode}');
      print('loginApi body ${response.body}');

      print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return userFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getStroeSchedule catch error $error');
      return Future.error(true);
    }
  }
}
