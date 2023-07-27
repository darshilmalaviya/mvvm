// // To parse this JSON data, do
// //
// //     final postApiResponseModel = postApiResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<PostApiResponseModel> postApiResponseModelFromJson(String str) =>
//     List<PostApiResponseModel>.from(
//         json.decode(str).map((x) => PostApiResponseModel.fromJson(x)));
//
// String postApiResponseModelToJson(List<PostApiResponseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class PostApiResponseModel {
//   int userId;
//   int id;
//   String title;
//   String body;
//
//   PostApiResponseModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.body,
//   });
//
//   factory PostApiResponseModel.fromJson(Map<String, dynamic> json) =>
//       PostApiResponseModel(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//       };
// }
