abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState(this.message);
}

class SuccessAuthState extends AuthState {
  final String message;

  SuccessAuthState(this.message);
}
