// To parse this JSON data, do
//
//     final getActivity = getActivityFromJson(jsonString);

import 'dart:convert';

List<GetActivity> getActivityFromJson(String str) => List<GetActivity>.from(
    json.decode(str).map((x) => GetActivity.fromJson(x)));

String getActivityToJson(List<GetActivity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetActivity {
  GetActivity({
    required this.id,
    required this.activiStartdate,
    required this.activiEnddate,
    required this.activiPlacename,
    required this.activiPosition,
    required this.createdate,
  });

  int id;
  DateTime activiStartdate;
  DateTime activiEnddate;
  String activiPlacename;
  String activiPosition;
  DateTime createdate;

  factory GetActivity.fromJson(Map<String, dynamic> json) => GetActivity(
        id: json["id"],
        activiStartdate: DateTime.parse(json["activi_startdate"]),
        activiEnddate: DateTime.parse(json["activi_enddate"]),
        activiPlacename: json["activi_placename"],
        activiPosition: json["activi_position"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activi_startdate": activiStartdate.toIso8601String(),
        "activi_enddate": activiEnddate.toIso8601String(),
        "activi_placename": activiPlacename,
        "activi_position": activiPosition,
        "createdate": createdate.toIso8601String(),
      };
}
