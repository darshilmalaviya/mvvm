import 'dart:convert';
import '../../Model/Response/get_todos_response_model.dart';
import '../api_handlers.dart';
import '../api_routes.dart';

class GetTodoRepo {
  static Future<List<TodoResponseModel>> getTodoRepo() async {
    var response = await ApiService()
        .getResponse(url: ApiRoutes.todos, apiType: APIType.aGet);

    List<TodoResponseModel> todo =
        todoResponseModelFromJson(jsonEncode(response));
    return todo;
  }
}
