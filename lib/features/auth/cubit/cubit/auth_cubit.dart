import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/core/utils/storage_helper.dart';
import 'package:e_commerce/features/auth/cubit/cubit/auth_state.dart';
import 'package:e_commerce/features/auth/models/login_response_model.dart';
import 'package:e_commerce/features/auth/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  void login({required String email, required String password}) async {
    emit(LoadingAuthState());

    final Either<String, LoginResponseModel> res = await _authRepo.login(
      email,
      password,
    );
    res.fold(
      (error) {
        emit(ErrorAuthState(error));
      },
      (right) {
        emit(SuccessAuthState("Login Successful"));
      },
    );

  }
    void Logout() {
      sl<StorageHelper>().removeToken();
    }
}
