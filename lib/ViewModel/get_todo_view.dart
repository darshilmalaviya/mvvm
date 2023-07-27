import 'dart:developer';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mvvm/ApiServices/Repo/get_todos_repo.dart';
import 'package:mvvm/Model/Response/get_todos_response_model.dart';

import '../ApiServices/api_response.dart';

class GetTodoViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;

  Future<void> getToDoViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<TodoResponseModel> response = await GetTodoRepo.getTodoRepo();

      _apiResponse = ApiResponse.complete(response);
      log('getPhotosViewModel----response---->>>>>>$response');
    } catch (e) {
      _apiResponse = ApiResponse.error(message: e.toString());
      log('getPhotosViewModel-------->>>>>>$e');
    }
    update();
  }
}
