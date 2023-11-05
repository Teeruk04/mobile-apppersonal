// To parse this JSON data, do
//
//     final fatherAndMother = fatherAndMotherFromJson(jsonString);

import 'dart:convert';

List<FatherAndMother> fatherAndMotherFromJson(String str) =>
    List<FatherAndMother>.from(
        json.decode(str).map((x) => FatherAndMother.fromJson(x)));

String fatherAndMotherToJson(List<FatherAndMother> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FatherAndMother {
  FatherAndMother({
    required this.id,
    required this.faName,
    required this.faLastname,
    required this.faBirthdate,
    required this.faPlacebirth,
    required this.faRace,
    required this.faReligion,
    required this.faNationality,
    required this.faAddress,
    required this.faPhone,
    required this.faOccupation,
    required this.faPosition,
    required this.faWorkplace,
    required this.faWPphone,
    required this.moName,
    required this.moLastname,
    required this.moBirthdate,
    required this.moPlacebirth,
    required this.moRace,
    required this.moReligion,
    required this.moNationality,
    required this.moAddress,
    required this.moPhone,
    required this.moOccupation,
    required this.moPosition,
    required this.moWorkplace,
    required this.moWPphone,
    required this.createdate,
    required this.faTitle,
    required this.title,
    required this.mOTitle,
    required this.titleM,
  });

  int id;
  String faName;
  String faLastname;
  DateTime faBirthdate;
  String faPlacebirth;
  String faRace;
  String faReligion;
  String faNationality;
  String faAddress;
  String faPhone;
  String faOccupation;
  String faPosition;
  String faWorkplace;
  String faWPphone;
  String moName;
  String moLastname;
  DateTime moBirthdate;
  String moPlacebirth;
  String moRace;
  String moReligion;
  String moNationality;
  String moAddress;
  String moPhone;
  String moOccupation;
  String moPosition;
  String moWorkplace;
  String moWPphone;
  DateTime createdate;
  int faTitle;
  Title title;
  int mOTitle;
  TitleM titleM;

  factory FatherAndMother.fromJson(Map<String, dynamic> json) =>
      FatherAndMother(
        id: json["id"],
        faName: json["fa_name"],
        faLastname: json["fa_lastname"],
        faBirthdate: DateTime.parse(json["fa_birthdate"]),
        faPlacebirth: json["fa_placebirth"],
        faRace: json["fa_race"],
        faReligion: json["fa_religion"],
        faNationality: json["fa_nationality"],
        faAddress: json["fa_address"],
        faPhone: json["fa_phone"],
        faOccupation: json["fa_occupation"],
        faPosition: json["fa_position"],
        faWorkplace: json["fa_workplace"],
        faWPphone: json["fa_WPphone"],
        moName: json["mo_name"],
        moLastname: json["mo_lastname"],
        moBirthdate: DateTime.parse(json["mo_birthdate"]),
        moPlacebirth: json["mo_placebirth"],
        moRace: json["mo_race"],
        moReligion: json["mo_religion"],
        moNationality: json["mo_nationality"],
        moAddress: json["mo_address"],
        moPhone: json["mo_phone"],
        moOccupation: json["mo_occupation"],
        moPosition: json["mo_position"],
        moWorkplace: json["mo_workplace"],
        moWPphone: json["mo_WPphone"],
        createdate: DateTime.parse(json["createdate"]),
        faTitle: json["fa_title"],
        title: Title.fromJson(json["title"]),
        mOTitle: json["mO_title"],
        titleM: TitleM.fromJson(json["titleM"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fa_name": faName,
        "fa_lastname": faLastname,
        "fa_birthdate": faBirthdate.toIso8601String(),
        "fa_placebirth": faPlacebirth,
        "fa_race": faRace,
        "fa_religion": faReligion,
        "fa_nationality": faNationality,
        "fa_address": faAddress,
        "fa_phone": faPhone,
        "fa_occupation": faOccupation,
        "fa_position": faPosition,
        "fa_workplace": faWorkplace,
        "fa_WPphone": faWPphone,
        "mo_name": moName,
        "mo_lastname": moLastname,
        "mo_birthdate": moBirthdate.toIso8601String(),
        "mo_placebirth": moPlacebirth,
        "mo_race": moRace,
        "mo_religion": moReligion,
        "mo_nationality": moNationality,
        "mo_address": moAddress,
        "mo_phone": moPhone,
        "mo_occupation": moOccupation,
        "mo_position": moPosition,
        "mo_workplace": moWorkplace,
        "mo_WPphone": moWPphone,
        "createdate": createdate.toIso8601String(),
        "fa_title": faTitle,
        "title": title.toJson(),
        "mO_title": mOTitle,
        "titleM": titleM.toJson(),
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

class TitleM {
  TitleM({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory TitleM.fromJson(Map<String, dynamic> json) => TitleM(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
