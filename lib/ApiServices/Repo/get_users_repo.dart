import 'dart:convert';

import 'package:mvvm/Model/Response/get_users_response_model.dart';

import '../api_handlers.dart';
import '../api_routes.dart';

class GetUserRepo {
  static Future<List<UsersResponseModel>> getUsersRepo() async {
    var response = await ApiService()
        .getResponse(url: ApiRoutes.users, apiType: APIType.aGet);

    List<UsersResponseModel> users =
        usersResponseModelFromJson(jsonEncode(response));
    return users;
  }
}
