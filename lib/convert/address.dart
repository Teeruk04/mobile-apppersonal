// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

List<Address> addressFromJson(String str) =>
    List<Address>.from(json.decode(str).map((x) => Address.fromJson(x)));

String addressToJson(List<Address> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Address {
  Address({
    required this.id,
    required this.addressStartdate,
    required this.addressEnddate,
    required this.addressHousenumber,
    required this.addressAlley,
    required this.addressRoad,
    required this.addressCanton,
    required this.addressDistrict,
    required this.addressProvince,
    required this.addressCountry,
    required this.createdate,
    required this.idStatusA,
    required this.statusA,
  });

  int id;
  DateTime addressStartdate;
  DateTime addressEnddate;
  String addressHousenumber;
  String addressAlley;
  String addressRoad;
  String addressCanton;
  String addressDistrict;
  String addressProvince;
  String addressCountry;
  DateTime createdate;
  int idStatusA;
  StatusA statusA;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        addressStartdate: DateTime.parse(json["address_startdate"]),
        addressEnddate: DateTime.parse(json["address_enddate"]),
        addressHousenumber: json["address_housenumber"],
        addressAlley: json["address_alley"],
        addressRoad: json["address_road"],
        addressCanton: json["address_canton"],
        addressDistrict: json["address_district"],
        addressProvince: json["address_province"],
        addressCountry: json["address_country"],
        createdate: DateTime.parse(json["createdate"]),
        idStatusA: json["id_statusA"],
        statusA: StatusA.fromJson(json["statusA"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address_startdate": addressStartdate.toIso8601String(),
        "address_enddate": addressEnddate.toIso8601String(),
        "address_housenumber": addressHousenumber,
        "address_alley": addressAlley,
        "address_road": addressRoad,
        "address_canton": addressCanton,
        "address_district": addressDistrict,
        "address_province": addressProvince,
        "address_country": addressCountry,
        "createdate": createdate.toIso8601String(),
        "id_statusA": idStatusA,
        "statusA": statusA.toJson(),
      };
}

class StatusA {
  StatusA({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory StatusA.fromJson(Map<String, dynamic> json) => StatusA(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
