import 'dart:developer';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiServices/Repo/get_posts_repo.dart';
import '../ApiServices/api_response.dart';
import '../Model/Response/get_posts_response_model.dart';

class GetPostsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getPostsViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<PostResponseModel> response = await GetPostsRepo.getPostsRepo();

      _apiResponse = ApiResponse.complete(response);
      log('getPhotosViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      log('getPhotosViewModel-------->>>>>>$e');
    }
    update();
  }
}
