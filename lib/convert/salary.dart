// To parse this JSON data, do
//
//     final salary = salaryFromJson(jsonString);

import 'dart:convert';

List<Salary> salaryFromJson(String str) =>
    List<Salary>.from(json.decode(str).map((x) => Salary.fromJson(x)));

String salaryToJson(List<Salary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Salary {
  Salary({
    required this.id,
    required this.salaryDetails,
    required this.salaryOrdernum,
    required this.salaryDatenum,
    required this.salaryEffectivedate,
    required this.salaryEnddate,
    required this.salarySalary,
    required this.salaryBeforepostpone,
    required this.salaryPercentage,
    required this.salaryCalculationbase,
    required this.createdate,
    required this.idStarusS,
    required this.status,
    required this.idTypeS,
    required this.types,
  });

  int id;
  String salaryDetails;
  String salaryOrdernum;
  DateTime salaryDatenum;
  DateTime salaryEffectivedate;
  DateTime salaryEnddate;
  double salarySalary;
  int salaryBeforepostpone;
  double salaryPercentage;
  int salaryCalculationbase;
  DateTime createdate;
  int idStarusS;
  Status status;
  int idTypeS;
  Status types;

  factory Salary.fromJson(Map<String, dynamic> json) => Salary(
        id: json["id"],
        salaryDetails: json["salary_details"],
        salaryOrdernum: json["salary_ordernum"],
        salaryDatenum: DateTime.parse(json["salary_datenum"]),
        salaryEffectivedate: DateTime.parse(json["salary_effectivedate"]),
        salaryEnddate: DateTime.parse(json["salary_enddate"]),
        salarySalary: json["salary_salary"].toDouble(),
        salaryBeforepostpone: json["salary_beforepostpone"],
        salaryPercentage: json["salary_percentage"].toDouble(),
        salaryCalculationbase: json["salary_calculationbase"],
        createdate: DateTime.parse(json["createdate"]),
        idStarusS: json["id_starusS"],
        status: Status.fromJson(json["status"]),
        idTypeS: json["id_TypeS"],
        types: Status.fromJson(json["types"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salary_details": salaryDetails,
        "salary_ordernum": salaryOrdernum,
        "salary_datenum": salaryDatenum.toIso8601String(),
        "salary_effectivedate": salaryEffectivedate.toIso8601String(),
        "salary_enddate": salaryEnddate.toIso8601String(),
        "salary_salary": salarySalary,
        "salary_beforepostpone": salaryBeforepostpone,
        "salary_percentage": salaryPercentage,
        "salary_calculationbase": salaryCalculationbase,
        "createdate": createdate.toIso8601String(),
        "id_starusS": idStarusS,
        "status": status.toJson(),
        "id_TypeS": idTypeS,
        "types": types.toJson(),
      };
}

class Status {
  Status({
    required this.id,
    required this.name,
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
