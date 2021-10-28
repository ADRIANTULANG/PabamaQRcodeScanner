// To parse this JSON data, do
//
//     final seat = seatFromJson(jsonString);

import 'dart:convert';

List<Seat> seatFromJson(String str) =>
    List<Seat>.from(json.decode(str).map((x) => Seat.fromJson(x)));

String seatToJson(List<Seat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Seat {
  Seat(
      {required this.seatId,
      required this.busId,
      required this.seatNumber,
      required this.seatStatus,
      required this.pickup});

  String seatId;
  String busId;
  String seatNumber;
  String seatStatus;
  String pickup;

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        seatId: json["seatID"],
        busId: json["busID"],
        seatNumber: json["seatNumber"],
        seatStatus: json["seatStatus"],
        pickup: json["pickup"],
      );

  Map<String, dynamic> toJson() => {
        "seatID": seatId,
        "busID": busId,
        "seatNumber": seatNumber,
        "seatStatus": seatStatus,
        "pickup": pickup,
      };
}
