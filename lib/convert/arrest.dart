// To parse this JSON data, do
//
//     final arrest = arrestFromJson(jsonString);

import 'dart:convert';

List<Arrest> arrestFromJson(String str) =>
    List<Arrest>.from(json.decode(str).map((x) => Arrest.fromJson(x)));

String arrestToJson(List<Arrest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Arrest {
  Arrest({
    required this.id,
    required this.arrestDate,
    required this.arrestCrimescene,
    required this.arrestPlaint,
    required this.arrestOutcomeofthecase,
    required this.createdate,
  });

  int id;
  DateTime arrestDate;
  String arrestCrimescene;
  String arrestPlaint;
  String arrestOutcomeofthecase;
  DateTime createdate;

  factory Arrest.fromJson(Map<String, dynamic> json) => Arrest(
        id: json["id"],
        arrestDate: DateTime.parse(json["arrest_date"]),
        arrestCrimescene: json["arrest_crimescene"],
        arrestPlaint: json["arrest_plaint"],
        arrestOutcomeofthecase: json["arrest_outcomeofthecase"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arrest_date": arrestDate.toIso8601String(),
        "arrest_crimescene": arrestCrimescene,
        "arrest_plaint": arrestPlaint,
        "arrest_outcomeofthecase": arrestOutcomeofthecase,
        "createdate": createdate.toIso8601String(),
      };
}
