// To parse this JSON data, do
//
//     final academicDetail = academicDetailFromJson(jsonString);

import 'dart:convert';

AcademicDetail academicDetailFromJson(String str) =>
    AcademicDetail.fromJson(json.decode(str));

String academicDetailToJson(AcademicDetail data) => json.encode(data.toJson());

class AcademicDetail {
  AcademicDetail({
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

  factory AcademicDetail.fromJson(Map<String, dynamic> json) => AcademicDetail(
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
