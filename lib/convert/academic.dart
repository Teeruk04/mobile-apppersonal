// To parse this JSON data, do
//
//     final academic = academicFromJson(jsonString);

import 'dart:convert';

List<Academic> academicFromJson(String str) =>
    List<Academic>.from(json.decode(str).map((x) => Academic.fromJson(x)));

String academicToJson(List<Academic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Academic {
  Academic({
    required this.id,
    required this.academicPosition,
    required this.academicBranchcode,
    required this.academicBranchname,
    required this.academicStartdate,
    required this.academicRefer,
    required this.file,
    required this.createdate,
  });

  int id;
  String academicPosition;
  String academicBranchcode;
  String academicBranchname;
  DateTime academicStartdate;
  String academicRefer;
  String file;
  DateTime createdate;

  factory Academic.fromJson(Map<String, dynamic> json) => Academic(
        id: json["id"],
        academicPosition: json["academic_position"],
        academicBranchcode: json["academic_branchcode"],
        academicBranchname: json["academic_branchname"],
        academicStartdate: DateTime.parse(json["academic_startdate"]),
        academicRefer: json["academic_refer"],
        file: json["file"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "academic_position": academicPosition,
        "academic_branchcode": academicBranchcode,
        "academic_branchname": academicBranchname,
        "academic_startdate": academicStartdate.toIso8601String(),
        "academic_refer": academicRefer,
        "file": file,
        "createdate": createdate.toIso8601String(),
      };
}
