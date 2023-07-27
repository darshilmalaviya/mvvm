import 'dart:developer';
import 'package:get/get.dart';
import '../ApiServices/Repo/get_post_api_repo.dart';
import '../ApiServices/api_response.dart';

class GetPostApiView extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getPostApiViewmodel({Map<String, dynamic>? body}) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      var response = await GetPostApiRepo.getPostApiRepo(body: body);

      _apiResponse = ApiResponse.complete(response);
      log('getPhotosViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      log('getPhotosViewModel-------->>>>>>$e');
    }
    update();
  }
}
