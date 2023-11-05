// To parse this JSON data, do
//
//     final leave = leaveFromJson(jsonString);

import 'dart:convert';

Leave leaveFromJson(String str) => Leave.fromJson(json.decode(str));

String leaveToJson(Leave data) => json.encode(data.toJson());

class Leave {
  Leave({
    required this.leavesickCount,
    required this.leavepersonalCount,
    required this.leavematerntityCount,
    required this.leaveThhwwgbCount,
    required this.leaveCount,
    required this.leaveordinationCount,
    required this.leaveforfastingCount,
    required this.leavespouseCount,
    required this.leaveforstudyCount,
    required this.leaves,
  });

  int leavesickCount;
  int leavepersonalCount;
  int leavematerntityCount;
  int leaveThhwwgbCount;
  int leaveCount;
  int leaveordinationCount;
  int leaveforfastingCount;
  int leavespouseCount;
  int leaveforstudyCount;
  List<Leaf> leaves;

  factory Leave.fromJson(Map<String, dynamic> json) => Leave(
        leavesickCount: json["leavesickCount"],
        leavepersonalCount: json["leavepersonalCount"],
        leavematerntityCount: json["leavematerntityCount"],
        leaveThhwwgbCount: json["leaveTHHWWGBCount"],
        leaveCount: json["leaveCount"],
        leaveordinationCount: json["leaveordinationCount"],
        leaveforfastingCount: json["leaveforfastingCount"],
        leavespouseCount: json["leavespouseCount"],
        leaveforstudyCount: json["leaveforstudyCount"],
        leaves: List<Leaf>.from(json["leaves"].map((x) => Leaf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leavesickCount": leavesickCount,
        "leavepersonalCount": leavepersonalCount,
        "leavematerntityCount": leavematerntityCount,
        "leaveTHHWWGBCount": leaveThhwwgbCount,
        "leaveCount": leaveCount,
        "leaveordinationCount": leaveordinationCount,
        "leaveforfastingCount": leaveforfastingCount,
        "leavespouseCount": leavespouseCount,
        "leaveforstudyCount": leaveforstudyCount,
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
