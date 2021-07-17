import 'package:flutter/cupertino.dart';

class MyData {
  String previous;
  String next;
  List<Results> results;

  MyData.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }
}

class Results {
  String firstName;
  String lastName;
  String email;
  String phone;
  bool verified;
  Results(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.verified});

  Results.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    verified = json['verified'];
  }
}
