// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  Data data;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.userName,
    required this.userLastname,
    required this.userCardnumber,
    required this.userBirthdate,
    required this.userPlaceofbirth,
    required this.userRace,
    required this.userNationality,
    required this.userReligion,
    required this.field,
    required this.createdate,
    required this.titlename,
    required this.statusUname,
    required this.sexname,
  });

  int id;
  String email;
  String userName;
  String userLastname;
  String userCardnumber;
  DateTime userBirthdate;
  String userPlaceofbirth;
  String userRace;
  String userNationality;
  String userReligion;
  String field;
  DateTime createdate;
  String titlename;
  String statusUname;
  String sexname;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        userName: json["user_name"],
        userLastname: json["user_lastname"],
        userCardnumber: json["user_cardnumber"],
        userBirthdate: DateTime.parse(json["user_birthdate"]),
        userPlaceofbirth: json["user_placeofbirth"],
        userRace: json["user_race"],
        userNationality: json["user_nationality"],
        userReligion: json["user_religion"],
        field: json["field"],
        createdate: DateTime.parse(json["createdate"]),
        titlename: json["titlename"],
        statusUname: json["statusUname"],
        sexname: json["sexname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "user_name": userName,
        "user_lastname": userLastname,
        "user_cardnumber": userCardnumber,
        "user_birthdate": userBirthdate.toIso8601String(),
        "user_placeofbirth": userPlaceofbirth,
        "user_race": userRace,
        "user_nationality": userNationality,
        "user_religion": userReligion,
        "field": field,
        "createdate": createdate.toIso8601String(),
        "titlename": titlename,
        "statusUname": statusUname,
        "sexname": sexname,
      };
}
