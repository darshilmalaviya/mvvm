import 'dart:developer';
import 'package:get/get.dart';
import 'package:mvvm/ApiServices/Repo/get_photos_repo.dart';
import 'package:mvvm/ApiServices/api_response.dart';
import 'package:mvvm/Model/Response/get_photos_response_model.dart';

class GetPhotosViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getPhotosViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<PhotosResponseModel> response = await GetPhotosRepo.getPhotosRepo();

      _apiResponse = ApiResponse.complete(response);
      log('getPhotosViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      log('getPhotosViewModel-------->>>>>>$e');
    }
    update();
  }
}
