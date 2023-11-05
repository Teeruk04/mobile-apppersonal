// To parse this JSON data, do
//
//     final marriage = marriageFromJson(jsonString);

import 'dart:convert';

List<Marriage> marriageFromJson(String str) =>
    List<Marriage>.from(json.decode(str).map((x) => Marriage.fromJson(x)));

String marriageToJson(List<Marriage> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Marriage {
  Marriage({
    required this.id,
    required this.marriaName,
    required this.marriaLastname,
    required this.marriaBirdate,
    required this.marriaRace,
    required this.marriaReligion,
    required this.marriaNationality,
    required this.marriaOccupation,
    required this.marriaPosition,
    required this.marriaWorkplace,
    required this.marriaWPphone,
    required this.marriiaWeddingday,
    required this.marriaAddress,
    required this.marriaPhone,
    required this.marriaDivorce,
    required this.marriaLastaddress,
    required this.createdate,
    required this.idTitle,
    required this.title,
    required this.idStatusPc,
    required this.statusPc,
  });

  int id;
  String marriaName;
  String marriaLastname;
  DateTime marriaBirdate;
  String marriaRace;
  String marriaReligion;
  String marriaNationality;
  String marriaOccupation;
  String marriaPosition;
  String marriaWorkplace;
  String marriaWPphone;
  DateTime marriiaWeddingday;
  String marriaAddress;
  String marriaPhone;
  String marriaDivorce;
  String marriaLastaddress;
  DateTime createdate;
  int idTitle;
  Title title;
  int idStatusPc;
  StatusPc statusPc;

  factory Marriage.fromJson(Map<String, dynamic> json) => Marriage(
        id: json["id"],
        marriaName: json["marria_name"],
        marriaLastname: json["marria_lastname"],
        marriaBirdate: DateTime.parse(json["marria_birdate"]),
        marriaRace: json["marria_race"],
        marriaReligion: json["marria_religion"],
        marriaNationality: json["marria_nationality"],
        marriaOccupation: json["marria_occupation"],
        marriaPosition: json["marria_position"],
        marriaWorkplace: json["marria_workplace"],
        marriaWPphone: json["marria_WPphone"],
        marriiaWeddingday: DateTime.parse(json["marriia_weddingday"]),
        marriaAddress: json["marria_address"],
        marriaPhone: json["marria_phone"],
        marriaDivorce: json["marria_divorce"],
        marriaLastaddress: json["marria_lastaddress"],
        createdate: DateTime.parse(json["createdate"]),
        idTitle: json["id_title"],
        title: Title.fromJson(json["title"]),
        idStatusPc: json["id_statusPC"],
        statusPc: StatusPc.fromJson(json["statusPC"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "marria_name": marriaName,
        "marria_lastname": marriaLastname,
        "marria_birdate": marriaBirdate.toIso8601String(),
        "marria_race": marriaRace,
        "marria_religion": marriaReligion,
        "marria_nationality": marriaNationality,
        "marria_occupation": marriaOccupation,
        "marria_position": marriaPosition,
        "marria_workplace": marriaWorkplace,
        "marria_WPphone": marriaWPphone,
        "marriia_weddingday": marriiaWeddingday.toIso8601String(),
        "marria_address": marriaAddress,
        "marria_phone": marriaPhone,
        "marria_divorce": marriaDivorce,
        "marria_lastaddress": marriaLastaddress,
        "createdate": createdate.toIso8601String(),
        "id_title": idTitle,
        "title": title.toJson(),
        "id_statusPC": idStatusPc,
        "statusPC": statusPc.toJson(),
      };
}

class StatusPc {
  StatusPc({
    required this.id,
    required this.statusPcName,
  });

  int id;
  String statusPcName;

  factory StatusPc.fromJson(Map<String, dynamic> json) => StatusPc(
        id: json["id"],
        statusPcName: json["statusPC_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "statusPC_name": statusPcName,
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
