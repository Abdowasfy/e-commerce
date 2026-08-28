import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/models/login_response_model.dart';
import 'package:e_commerce/core/networking/api_endpoints.dart';
import 'package:e_commerce/core/networking/api_helper.dart';

class AuthRepo {
  Future<Either<String, LoginResponseModel>> login(String email,String password,) async {
    try {
    final response = await DioHelper.postRequest(
      endPoint: ApiEndpoints.login,
      data: {"email": email, "password": password},
    );



    if (response.statusCode == 200 || response.statusCode == 201) {
      LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
        response.data,
      );
      return Right(loginResponseModel);
    } else {
      return Left(response.toString());
    }
  } catch(error) {
      return Left("Invalid Credentials");
    }
}
}
