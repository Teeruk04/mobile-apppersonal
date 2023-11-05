// To parse this JSON data, do
//
//     final child = childFromJson(jsonString);

import 'dart:convert';

List<Child> childFromJson(String str) =>
    List<Child>.from(json.decode(str).map((x) => Child.fromJson(x)));

String childToJson(List<Child> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Child {
  Child({
    required this.id,
    required this.childName,
    required this.childLastname,
    required this.childBirthdate,
    required this.childRace,
    required this.childNationlyty,
    required this.childReligion,
    required this.chaildAddress,
    required this.childOccupation,
    required this.childPosition,
    required this.childWorkplace,
    required this.childPhone,
    required this.createdate,
    required this.idTitle,
    required this.title,
  });

  int id;
  String childName;
  String childLastname;
  DateTime childBirthdate;
  String childRace;
  String childNationlyty;
  String childReligion;
  String chaildAddress;
  String childOccupation;
  String childPosition;
  String childWorkplace;
  String childPhone;
  DateTime createdate;
  int idTitle;
  Title title;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        childName: json["child_name"],
        childLastname: json["child_lastname"],
        childBirthdate: DateTime.parse(json["child_birthdate"]),
        childRace: json["child_race"],
        childNationlyty: json["child_nationlyty"],
        childReligion: json["child_religion"],
        chaildAddress: json["chaild_address"],
        childOccupation: json["child_occupation"],
        childPosition: json["child_position"],
        childWorkplace: json["child_workplace"],
        childPhone: json["child_phone"],
        createdate: DateTime.parse(json["createdate"]),
        idTitle: json["id_title"],
        title: Title.fromJson(json["title"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "child_name": childName,
        "child_lastname": childLastname,
        "child_birthdate": childBirthdate.toIso8601String(),
        "child_race": childRace,
        "child_nationlyty": childNationlyty,
        "child_religion": childReligion,
        "chaild_address": chaildAddress,
        "child_occupation": childOccupation,
        "child_position": childPosition,
        "child_workplace": childWorkplace,
        "child_phone": childPhone,
        "createdate": createdate.toIso8601String(),
        "id_title": idTitle,
        "title": title.toJson(),
      };
}

class Title {
  Title({
    required this.id,
    required this.titleName,
    required this.createdate,
  });

  int id;
  String titleName;
  DateTime createdate;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        id: json["id"],
        titleName: json["title_name"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_name": titleName,
        "createdate": createdate.toIso8601String(),
      };
}
