// To parse this JSON data, do
//
//     final reportLeaveById = reportLeaveByIdFromJson(jsonString);

import 'dart:convert';

ReportLeaveById reportLeaveByIdFromJson(String str) =>
    ReportLeaveById.fromJson(json.decode(str));

String reportLeaveByIdToJson(ReportLeaveById data) =>
    json.encode(data.toJson());

class ReportLeaveById {
  ReportLeaveById({
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
  List<Leaf> leaves;

  factory ReportLeaveById.fromJson(Map<String, dynamic> json) =>
      ReportLeaveById(
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
        leaves: List<Leaf>.from(json["leaves"].map((x) => Leaf.fromJson(x))),
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
        "leaves": List<dynamic>.from(leaves.map((x) => x.toJson())),
      };
}

class Leaf {
  Leaf({
    required this.id,
    required this.leaveType,
    required this.leaveQuantity,
    required this.leaveStartdate,
    required this.leaveEnddate,
    required this.leaveNote,
    required this.createdate,
  });

  int id;
  int leaveType;
  int leaveQuantity;
  DateTime leaveStartdate;
  DateTime leaveEnddate;
  String leaveNote;
  DateTime createdate;

  factory Leaf.fromJson(Map<String, dynamic> json) => Leaf(
        id: json["id"],
        leaveType: json["leave_type"],
        leaveQuantity: json["leave_quantity"],
        leaveStartdate: DateTime.parse(json["leave_startdate"]),
        leaveEnddate: DateTime.parse(json["leave_enddate"]),
        leaveNote: json["leave_note"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "leave_type": leaveType,
        "leave_quantity": leaveQuantity,
        "leave_startdate": leaveStartdate.toIso8601String(),
        "leave_enddate": leaveEnddate.toIso8601String(),
        "leave_note": leaveNote,
        "createdate": createdate.toIso8601String(),
      };
}
