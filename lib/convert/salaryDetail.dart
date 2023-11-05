// To parse this JSON data, do
//
//     final detailSalary = detailSalaryFromJson(jsonString);

import 'dart:convert';

DetailSalary detailSalaryFromJson(String str) =>
    DetailSalary.fromJson(json.decode(str));

String detailSalaryToJson(DetailSalary data) => json.encode(data.toJson());

class DetailSalary {
  DetailSalary({
    this.id,
    this.salaryDetails,
    this.salaryOrdernum,
    this.salaryDatenum,
    this.salaryEffectivedate,
    this.salaryEnddate,
    this.salarySalary,
    this.salaryBeforepostpone,
    this.salaryPercentage,
    this.salaryCalculationbase,
    this.createdate,
    this.idStarusS,
    this.status,
    this.idTypeS,
    this.types,
  });

  int? id;
  String? salaryDetails;
  String? salaryOrdernum;
  DateTime? salaryDatenum;
  DateTime? salaryEffectivedate;
  DateTime? salaryEnddate;
  double? salarySalary;
  int? salaryBeforepostpone;
  dynamic? salaryPercentage;
  int? salaryCalculationbase;
  DateTime? createdate;
  int? idStarusS;
  Status? status;
  int? idTypeS;
  Status? types;

  factory DetailSalary.fromJson(Map<String, dynamic> json) => DetailSalary(
        id: json["id"],
        salaryDetails: json["salary_details"],
        salaryOrdernum: json["salary_ordernum"],
        salaryDatenum: json["salary_datenum"] == null
            ? null
            : DateTime.parse(json["salary_datenum"]),
        salaryEffectivedate: json["salary_effectivedate"] == null
            ? null
            : DateTime.parse(json["salary_effectivedate"]),
        salaryEnddate: json["salary_enddate"] == null
            ? null
            : DateTime.parse(json["salary_enddate"]),
        salarySalary: json["salary_salary"]?.toDouble(),
        salaryBeforepostpone: json["salary_beforepostpone"],
        salaryPercentage: json["salary_percentage"],
        salaryCalculationbase: json["salary_calculationbase"],
        createdate: json["createdate"] == null
            ? null
            : DateTime.parse(json["createdate"]),
        idStarusS: json["id_starusS"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        idTypeS: json["id_TypeS"],
        types: json["types"] == null ? null : Status.fromJson(json["types"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "salary_details": salaryDetails,
        "salary_ordernum": salaryOrdernum,
        "salary_datenum": salaryDatenum?.toIso8601String(),
        "salary_effectivedate": salaryEffectivedate?.toIso8601String(),
        "salary_enddate": salaryEnddate?.toIso8601String(),
        "salary_salary": salarySalary,
        "salary_beforepostpone": salaryBeforepostpone,
        "salary_percentage": salaryPercentage,
        "salary_calculationbase": salaryCalculationbase,
        "createdate": createdate?.toIso8601String(),
        "id_starusS": idStarusS,
        "status": status?.toJson(),
        "id_TypeS": idTypeS,
        "types": types?.toJson(),
      };
}

class Status {
  Status({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
