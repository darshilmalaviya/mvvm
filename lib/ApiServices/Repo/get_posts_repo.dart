import 'dart:convert';
import '../../Model/Response/get_posts_response_model.dart';
import '../api_handlers.dart';
import '../api_routes.dart';

class GetPostsRepo {
  static Future<List<PostResponseModel>> getPostsRepo() async {
    var response = await ApiService()
        .getResponse(url: ApiRoutes.posts, apiType: APIType.aGet);

    List<PostResponseModel> posts =
        postResponseModelFromJson(jsonEncode(response));
    return posts;
  }
}
