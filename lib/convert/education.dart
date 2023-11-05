// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

List<Education> educationFromJson(String str) =>
    List<Education>.from(json.decode(str).map((x) => Education.fromJson(x)));

String educationToJson(List<Education> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Education {
  Education({
    required this.id,
    required this.educaStartdate,
    required this.educaEnddate,
    required this.educaPlacename,
    required this.educaLocation,
    required this.educaCourse,
    required this.educaResults,
    required this.file,
    required this.createdat,
    required this.idLevel,
    required this.level,
  });

  int id;
  DateTime educaStartdate;
  DateTime educaEnddate;
  String educaPlacename;
  String educaLocation;
  String educaCourse;
  String educaResults;
  String file;
  DateTime createdat;
  int idLevel;
  Level level;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        educaStartdate: DateTime.parse(json["educa_startdate"]),
        educaEnddate: DateTime.parse(json["educa_enddate"]),
        educaPlacename: json["educa_placename"],
        educaLocation: json["educa_location"],
        educaCourse: json["educa_course"],
        educaResults: json["educa_results"],
        file: json["file"],
        createdat: DateTime.parse(json["createdat"]),
        idLevel: json["id_level"],
        level: Level.fromJson(json["level"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "educa_startdate": educaStartdate.toIso8601String(),
        "educa_enddate": educaEnddate.toIso8601String(),
        "educa_placename": educaPlacename,
        "educa_location": educaLocation,
        "educa_course": educaCourse,
        "educa_results": educaResults,
        "file": file,
        "createdat": createdat.toIso8601String(),
        "id_level": idLevel,
        "level": level.toJson(),
      };
}

class Level {
  Level({
    required this.id,
    required this.levelName,
    required this.createdate,
  });

  int id;
  String levelName;
  DateTime createdate;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        levelName: json["level_name"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "level_name": levelName,
        "createdate": createdate.toIso8601String(),
      };
}
