// To parse this JSON data, do
//
//     final reportLeave = reportLeaveFromJson(jsonString);

import 'dart:convert';

List<ReportLeave> reportLeaveFromJson(String str) => List<ReportLeave>.from(
    json.decode(str).map((x) => ReportLeave.fromJson(x)));

String reportLeaveToJson(List<ReportLeave> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportLeave {
  ReportLeave({
    required this.id,
    required this.reportLLastyear,
    required this.reportLThisyear,
    required this.reportLLeavesick,
    required this.reportLLeavepersonal,
    required this.reportLLeavematerntity,
    required this.reportLLeaveThhwwgb,
    required this.reportLLeave,
    required this.reportLLeaveordination,
    required this.reportLLeaveforfasting,
    required this.reportLLeavespouse,
    required this.reportLLeaveforstudy,
    required this.createdate,
    required this.leaves,
  });

  int id;
  int reportLLastyear;
  int reportLThisyear;
  int reportLLeavesick;
  int reportLLeavepersonal;
  int reportLLeavematerntity;
  int reportLLeaveThhwwgb;
  int reportLLeave;
  int reportLLeaveordination;
  int reportLLeaveforfasting;
  int reportLLeavespouse;
  int reportLLeaveforstudy;
  DateTime createdate;
  List<dynamic> leaves;

  factory ReportLeave.fromJson(Map<String, dynamic> json) => ReportLeave(
        id: json["id"],
        reportLLastyear: json["reportL_lastyear"],
        reportLThisyear: json["reportL_thisyear"],
        reportLLeavesick: json["reportL_leavesick"],
        reportLLeavepersonal: json["reportL_leavepersonal"],
        reportLLeavematerntity: json["reportL_leavematerntity"],
        reportLLeaveThhwwgb: json["reportL_leaveTHHWWGB"],
        reportLLeave: json["reportL_leave"],
        reportLLeaveordination: json["reportL_leaveordination"],
        reportLLeaveforfasting: json["reportL_leaveforfasting"],
        reportLLeavespouse: json["reportL_leavespouse"],
        reportLLeaveforstudy: json["reportL_leaveforstudy"],
        createdate: DateTime.parse(json["createdate"]),
        leaves: List<dynamic>.from(json["leaves"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reportL_lastyear": reportLLastyear,
        "reportL_thisyear": reportLThisyear,
        "reportL_leavesick": reportLLeavesick,
        "reportL_leavepersonal": reportLLeavepersonal,
        "reportL_leavematerntity": reportLLeavematerntity,
        "reportL_leaveTHHWWGB": reportLLeaveThhwwgb,
        "reportL_leave": reportLLeave,
        "reportL_leaveordination": reportLLeaveordination,
        "reportL_leaveforfasting": reportLLeaveforfasting,
        "reportL_leavespouse": reportLLeavespouse,
        "reportL_leaveforstudy": reportLLeaveforstudy,
        "createdate": createdate.toIso8601String(),
        "leaves": List<dynamic>.from(leaves.map((x) => x)),
      };
}
