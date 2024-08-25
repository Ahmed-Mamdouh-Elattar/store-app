import 'package:flutter/foundation.dart';

class UserModel {
  final String email;
  final String name;
  final String birthDate;
  final String image;
  final String gender;

  UserModel(
      {required this.email,
      required this.name,
      required this.birthDate,
      required this.image,
      required this.gender});

  factory UserModel.fromjson(json) {
    return UserModel(
        email: json["user_email"],
        name: json["name"],
        birthDate: json["birth_date"],
        image: json["image"],
        gender: json["gender"]);
  }
}
