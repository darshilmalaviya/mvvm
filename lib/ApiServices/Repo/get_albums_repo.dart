import 'dart:convert';
import '../../Model/Response/get_albums_response_model.dart';
import '../api_handlers.dart';
import '../api_routes.dart';

class GetAlbumsRepo {
  static Future<List<AlbumResponseModel>> getAlbumsRepo() async {
    var response = await ApiService()
        .getResponse(url: ApiRoutes.albums, apiType: APIType.aGet);

    List<AlbumResponseModel> photos =
        albumResponseModelFromJson(jsonEncode(response));
    return photos;
  }
}
