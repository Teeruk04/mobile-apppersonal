// To parse this JSON data, do
//
//     final work = workFromJson(jsonString);

import 'dart:convert';

List<Work> workFromJson(String str) =>
    List<Work>.from(json.decode(str).map((x) => Work.fromJson(x)));

String workToJson(List<Work> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Work {
  Work({
    required this.id,
    required this.workHStartdate,
    required this.workHEnddate,
    required this.workHEmployer,
    required this.workHPlacename,
    required this.workHPosition,
    required this.workHReason,
    required this.createdate,
  });

  int id;
  DateTime workHStartdate;
  DateTime workHEnddate;
  String workHEmployer;
  String workHPlacename;
  String workHPosition;
  String workHReason;
  DateTime createdate;

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        id: json["id"],
        workHStartdate: DateTime.parse(json["workH_startdate"]),
        workHEnddate: DateTime.parse(json["workH_enddate"]),
        workHEmployer: json["workH_employer"],
        workHPlacename: json["workH_placename"],
        workHPosition: json["workH_position"],
        workHReason: json["workH_reason"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "workH_startdate": workHStartdate.toIso8601String(),
        "workH_enddate": workHEnddate.toIso8601String(),
        "workH_employer": workHEmployer,
        "workH_placename": workHPlacename,
        "workH_position": workHPosition,
        "workH_reason": workHReason,
        "createdate": createdate.toIso8601String(),
      };
}
