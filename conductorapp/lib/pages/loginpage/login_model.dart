// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.userid,
    required this.conductor_name,
    required this.username,
    required this.password,
    required this.busid,
  });

  String userid;
  String conductor_name;
  String username;
  String password;
  String busid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userid: json["userid"],
        conductor_name: json["conductor_name"],
        username: json["username"],
        password: json["password"],
        busid: json["busid"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "conductor_name": conductor_name,
        "username": username,
        "password": password,
        "busid": busid,
      };
}
