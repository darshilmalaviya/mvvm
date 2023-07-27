// To parse this JSON data, do
//
//     final todoResponseModel = todoResponseModelFromJson(jsonString);

import 'dart:convert';

List<TodoResponseModel> todoResponseModelFromJson(String str) =>
    List<TodoResponseModel>.from(
        json.decode(str).map((x) => TodoResponseModel.fromJson(x)));

String todoResponseModelToJson(List<TodoResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoResponseModel {
  int userId;
  int id;
  String title;
  bool completed;

  TodoResponseModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoResponseModel.fromJson(Map<String, dynamic> json) =>
      TodoResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
