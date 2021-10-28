import 'dart:async';
import 'dart:convert';

import 'package:conductorapp/pages/QrCodepage/qrcode_model.dart';
import 'package:http/http.dart' as http;

import 'package:conductorapp/helpers/endpoints.dart';

class QRapi {
// Future<List<TransactionInfo>>
  static Future<List<TransactionInfo>> getTransaction({
    required String transactionID,
  }) async {
    print("transactionid $transactionID");
    try {
      var response = await http.post(
        Uri.parse("$endPoint/getTransactionInfo.php"),
        body: {
          "id": transactionID.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('getSeats code ${response.statusCode}');
      // print('getSeats body ${response.body}');

      print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
        return transactionInfoFromJson(json.encode(json.decode(response.body)));
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('getSeats catch error $error');
      return Future.error(true);
    }
  }

  static updateStatus(
      {required String transactionID, required String busID}) async {
    print("transactionid $transactionID");
    try {
      var response = await http.post(
        Uri.parse("$endPoint/updateStatus.php"),
        body: {
          "busid": busID.toString(),
          "trID": transactionID.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('updateStatus code ${response.statusCode}');
      // print('updateStatus body ${response.body}');

      print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('updateStatus catch error $error');
      return Future.error(true);
    }
  }

  static updateSeatNumber(
      {required String seatnumber, required String busID}) async {
    try {
      var response = await http.post(
        Uri.parse("$endPoint/updateSeatNumber.php"),
        body: {
          "busid": busID.toString(),
          "seatNumber": seatnumber.toString(),
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("timeout");
      });
      // print('updateSeatNumber code ${response.statusCode}');
      // print('updateSeatNumber body ${response.body}');

      print(json.encode(json.decode(response.body)));
      if (response.statusCode == 200) {
      } else {
        return Future.error(true);
      }
    } catch (error) {
      print('updateSeatNumber catch error $error');
      return Future.error(true);
    }
  }
}
