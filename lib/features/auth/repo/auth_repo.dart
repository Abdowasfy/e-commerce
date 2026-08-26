import 'dart:developer';

import 'package:e_commerce/networking/api_endpoints.dart';
import 'package:e_commerce/networking/api_helper.dart';

class AuthRepo {
  Future login(String username, String password) async {
    
    final response = await DioHelper.postRequest(
      endPoint: ApiEndpoints.login,
      data: {
        "email": username,
        "password": password,
      },
    );
   log(response.data.toString());
  }
}
