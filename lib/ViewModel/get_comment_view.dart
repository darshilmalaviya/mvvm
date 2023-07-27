import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../ApiServices/Repo/get_albums_repo.dart';
import '../ApiServices/Repo/get_comments_repo.dart';
import '../ApiServices/api_response.dart';
import '../Model/Response/get_comments_response_model.dart';

class GetCommentsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getCommentViewmodel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CommentResponseModel> response =
          await GetCommentsRepo.getCommentsRepo();

      _apiResponse = ApiResponse.complete(response);
      log('getPhotosViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      log('getPhotosViewModel-------->>>>>>$e');
    }
    update();
  }
}
