import 'dart:developer';
import 'package:get/get.dart';
import 'package:mvvm/ApiServices/Repo/get_albums_repo.dart';
import 'package:mvvm/Model/Response/get_albums_response_model.dart';
import '../ApiServices/api_response.dart';

class GetAlbumsViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getAlbumsViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<AlbumResponseModel> response = await GetAlbumsRepo.getAlbumsRepo();

      _apiResponse = ApiResponse.complete(response);
      log('getPhotosViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      log('getPhotosViewModel-------->>>>>>$e');
    }
    update();
  }
}
