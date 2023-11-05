// To parse this JSON data, do
//
//     final ingisnia = ingisniaFromJson(jsonString);

import 'dart:convert';

List<Ingisnia> ingisniaFromJson(String str) => List<Ingisnia>.from(json.decode(str).map((x) => Ingisnia.fromJson(x)));

String ingisniaToJson(List<Ingisnia> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ingisnia {
    Ingisnia({
    required    this.id,
   required     this.insigniaName,
    required    this.insigniaYear,
    required    this.insigniaReceiveddate,
   required     this.createdate,
    });

    int id;
    String insigniaName;
    String insigniaYear;
    DateTime insigniaReceiveddate;
    DateTime createdate;

    factory Ingisnia.fromJson(Map<String, dynamic> json) => Ingisnia(
        id: json["id"],
        insigniaName: json["insignia_name"],
        insigniaYear: json["insignia_year"],
        insigniaReceiveddate: DateTime.parse(json["insignia_receiveddate"]),
        createdate: DateTime.parse(json["createdate"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "insignia_name": insigniaName,
        "insignia_year": insigniaYear,
        "insignia_receiveddate": insigniaReceiveddate.toIso8601String(),
        "createdate": createdate.toIso8601String(),
    };
}
