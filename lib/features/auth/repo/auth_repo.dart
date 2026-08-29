import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/core/utils/storage_helper.dart';
import 'package:e_commerce/features/auth/models/login_response_model.dart';
import 'package:e_commerce/core/networking/api_endpoints.dart';
import 'package:e_commerce/core/networking/api_helper.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(this._dioHelper);

  Future<Either<String, LoginResponseModel>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndpoints.login,
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(
          response.data,
        );

         if(loginResponseModel.token != null){
          sl<StorageHelper>().saveToken(loginResponseModel.token!);
          return Right(loginResponseModel);
        }else{
          return const Left("Token is null");
        }




      } else {
        return Left(response.toString());
      }
    } catch (error) {
      return Left("Invalid Credentials");
    }
  }
}
