// To parse this JSON data, do
//
//     final codesModel = codesModelFromJson(jsonString);

import 'dart:convert';

CodesModel codesModelFromJson(String str) =>
    CodesModel.fromJson(json.decode(str));

String codesModelToJson(CodesModel data) => json.encode(data.toJson());

class CodesModel {
  CodesModel({
    this.result,
    this.documentation,
    this.termsOfUse,
    this.supportedCodes,
  });

  String? result;
  String? documentation;
  String? termsOfUse;
  List<List<String>>? supportedCodes;

  factory CodesModel.fromJson(Map<String, dynamic> json) => CodesModel(
        result: json["result"],
        documentation: json["documentation"],
        termsOfUse: json["terms_of_use"],
        supportedCodes: json["supported_codes"] == null
            ? []
            : List<List<String>>.from(json["supported_codes"]!
                .map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "documentation": documentation,
        "terms_of_use": termsOfUse,
        "supported_codes": supportedCodes == null
            ? []
            : List<dynamic>.from(supportedCodes!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
