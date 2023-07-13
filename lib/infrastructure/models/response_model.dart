import 'dart:convert';

ResponseModel selectableItemFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String selectableItemToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({this.statusCode, this.message, this.data});

  int? statusCode;
  String? message;
  dynamic data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(statusCode: json["StatusCode"], message: json["Message"], data: json["Data"]);

  Map<String, dynamic> toJson() => {"StatusCode": statusCode, "Message": message, "Data": data};
}
