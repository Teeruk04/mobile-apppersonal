// To parse this JSON data, do
//
//     final travel = travelFromJson(jsonString);

import 'dart:convert';

List<Travel> travelFromJson(String str) =>
    List<Travel>.from(json.decode(str).map((x) => Travel.fromJson(x)));

String travelToJson(List<Travel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Travel {
  Travel({
    required this.id,
    required this.travelStartdate,
    required this.travelEnddate,
    required this.travelCity,
    required this.travelCounty,
    required this.travelPurpose,
    required this.travelCapital,
    required this.cratedate,
  });

  int id;
  DateTime travelStartdate;
  DateTime travelEnddate;
  String travelCity;
  String travelCounty;
  String travelPurpose;
  String travelCapital;
  DateTime cratedate;

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
        id: json["id"],
        travelStartdate: DateTime.parse(json["travel_startdate"]),
        travelEnddate: DateTime.parse(json["travel_enddate"]),
        travelCity: json["travel_city"],
        travelCounty: json["travel_county"],
        travelPurpose: json["travel_purpose"],
        travelCapital: json["travel_capital"],
        cratedate: DateTime.parse(json["cratedate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "travel_startdate": travelStartdate.toIso8601String(),
        "travel_enddate": travelEnddate.toIso8601String(),
        "travel_city": travelCity,
        "travel_county": travelCounty,
        "travel_purpose": travelPurpose,
        "travel_capital": travelCapital,
        "cratedate": cratedate.toIso8601String(),
      };
}
