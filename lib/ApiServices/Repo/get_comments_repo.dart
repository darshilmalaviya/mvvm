// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import '../../Model/Response/get_comments_response_model.dart';
import '../api_handlers.dart';
import '../api_routes.dart';

class GetCommentsRepo {
  static Future<List<CommentResponseModel>> getCommentsRepo() async {
    var response = await ApiService()
        .getResponse(url: ApiRoutes.comments, apiType: APIType.aGet);

    List<CommentResponseModel> Comment =
        commentResponseModelFromJson(jsonEncode(response));
    return Comment;
  }
}
