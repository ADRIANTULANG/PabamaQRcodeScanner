// To parse this JSON data, do
//
//     final transactionInfo = transactionInfoFromJson(jsonString);

import 'dart:convert';

List<TransactionInfo> transactionInfoFromJson(String str) =>
    List<TransactionInfo>.from(
        json.decode(str).map((x) => TransactionInfo.fromJson(x)));

String transactionInfoToJson(List<TransactionInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionInfo {
  TransactionInfo({
    required this.transactionId,
    required this.pickup,
    required this.dropout,
    required this.customername,
    required this.customerid,
    required this.busid,
    required this.busname,
    required this.fare,
    required this.status,
    required this.seatnumber,
  });

  String transactionId;
  String pickup;
  String dropout;
  String customername;
  String customerid;
  String busid;
  String busname;
  String fare;
  String status;
  String seatnumber;

  factory TransactionInfo.fromJson(Map<String, dynamic> json) =>
      TransactionInfo(
        transactionId: json["transactionID"],
        pickup: json["pickup"],
        dropout: json["dropout"],
        customername: json["customername"],
        customerid: json["customerid"],
        busid: json["busid"],
        busname: json["busname"],
        fare: json["fare"],
        status: json["status"],
        seatnumber: json["seatnumber"],
      );

  Map<String, dynamic> toJson() => {
        "transactionID": transactionId,
        "pickup": pickup,
        "dropout": dropout,
        "customername": customername,
        "customerid": customerid,
        "busid": busid,
        "busname": busname,
        "fare": fare,
        "status": status,
        "seatnumber": seatnumber,
      };
}
