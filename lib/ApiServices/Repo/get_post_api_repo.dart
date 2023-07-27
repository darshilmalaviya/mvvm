import 'package:mvvm/ApiServices/api_routes.dart';
import '../api_handlers.dart';

class GetPostApiRepo {
  static Future getPostApiRepo({Map<String, dynamic>? body}) async {
    var response = await ApiService().getResponse(
      apiType: APIType.aPost,
      url: ApiRoutes.Post,
      body: body,
    );

    return response;
  }
}
