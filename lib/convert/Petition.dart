// To parse this JSON data, do
//
//     final petitionAll = petitionAllFromJson(jsonString);

import 'dart:convert';

List<PetitionAll> petitionAllFromJson(String str) => List<PetitionAll>.from(
    json.decode(str).map((x) => PetitionAll.fromJson(x)));

String petitionAllToJson(List<PetitionAll> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetitionAll {
  PetitionAll({
    required this.id,
    required this.petiMessage,
    required this.file,
    required this.petiStaus,
    required this.createdate,
  });

  int id;
  String petiMessage;
  String file;
  String petiStaus;
  DateTime createdate;

  factory PetitionAll.fromJson(Map<String, dynamic> json) => PetitionAll(
        id: json["id"],
        petiMessage: json["peti_message"],
        file: json["file"],
        petiStaus: json["peti_staus"],
        createdate: DateTime.parse(json["createdate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "peti_message": petiMessage,
        "file": file,
        "peti_staus": petiStaus,
        "createdate": createdate.toIso8601String(),
      };
}
