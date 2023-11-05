// To parse this JSON data, do
//
//     final manage = manageFromJson(jsonString);

import 'dart:convert';

List<Manage> manageFromJson(String str) => List<Manage>.from(json.decode(str).map((x) => Manage.fromJson(x)));

String manageToJson(List<Manage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Manage {
    Manage({
   required     this.id,
   required     this.managePPosition,
  required      this.managePAgency,
  required      this.managePDetails,
 required       this.managePStartdate,
   required     this.managePEnddate,
   required     this.managePRefer,
   required     this.createdate,
  required      this.idStatusS,
   required     this.status,
    });

    int id;
    String managePPosition;
    String managePAgency;
    String managePDetails;
    DateTime managePStartdate;
    DateTime managePEnddate;
    String managePRefer;
    DateTime createdate;
    int idStatusS;
    Status status;

    factory Manage.fromJson(Map<String, dynamic> json) => Manage(
        id: json["id"],
        managePPosition: json["manageP_position"],
        managePAgency: json["manageP_agency"],
        managePDetails: json["manageP_details"],
        managePStartdate: DateTime.parse(json["manageP_startdate"]),
        managePEnddate: DateTime.parse(json["manageP_enddate"]),
        managePRefer: json["manageP_refer"],
        createdate: DateTime.parse(json["createdate"]),
        idStatusS: json["id_statusS"],
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "manageP_position": managePPosition,
        "manageP_agency": managePAgency,
        "manageP_details": managePDetails,
        "manageP_startdate": managePStartdate.toIso8601String(),
        "manageP_enddate": managePEnddate.toIso8601String(),
        "manageP_refer": managePRefer,
        "createdate": createdate.toIso8601String(),
        "id_statusS": idStatusS,
        "status": status.toJson(),
    };
}

class Status {
    Status({
      required  this.id,
      required  this.name,
    });

    int id;
    String name;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
