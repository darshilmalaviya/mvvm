import 'dart:convert';
import 'package:mvvm/ApiServices/api_handlers.dart';
import 'package:mvvm/Model/Response/get_photos_response_model.dart';
import '../api_routes.dart';

class GetPhotosRepo {
  static Future<List<PhotosResponseModel>> getPhotosRepo() async {
    var response = await ApiService()
        .getResponse(url: ApiRoutes.photos, apiType: APIType.aGet);

    List<PhotosResponseModel> photos =
        photosResponseModelFromJson(jsonEncode(response));
    return photos;
  }
}
