// To parse this JSON data, do
//
//     final albumResponseModel = albumResponseModelFromJson(jsonString);

import 'dart:convert';

List<AlbumResponseModel> albumResponseModelFromJson(String str) =>
    List<AlbumResponseModel>.from(
        json.decode(str).map((x) => AlbumResponseModel.fromJson(x)));

String albumResponseModelToJson(List<AlbumResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumResponseModel {
  int userId;
  int id;
  String title;

  AlbumResponseModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumResponseModel.fromJson(Map<String, dynamic> json) =>
      AlbumResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
