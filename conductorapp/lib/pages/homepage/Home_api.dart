import 'dart:async';
import 'dart:convert';
import 'package:conductorapp/pages/homepage/Home_model.dart';
import 'package:http/http.dart' as http;

import 'package:conductorapp/helpers/endpoints.dart';

class HomeApi {
// Future<List<Seat>>
  static Future<List<Seat>> getSeats({
    required String busid,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getSeatsBusID.php"),
        body: {
          "busid": busid.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('getSeats code ${response.statusCode}');
      // print('getSeats body ${response.body}');

      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return seatFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getSeats catch error $error');
      return Future.error(true);
    }
  }

  static updateSeatStatusToVacant(
      {required String busid,
      required String seatno,
      required String status}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/updateSeatNumberToVacant.php"),
        body: {
          "busid": busid.toString(),
          "seatNumber": seatno.toString(),
          "status": status.toString()
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('getSeats code ${response.statusCode}');
      // print('getSeats body ${response.body}');

      // print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        // return seatFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getSeats catch error $error');
      return Future.error(true);
    }
  }
}
