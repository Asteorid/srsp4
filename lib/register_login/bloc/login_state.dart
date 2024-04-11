abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class LocaleInitLoginState extends LoginState {}

class UnAuthLoginState extends LoginState {}

class AuthLoginState extends LoginState {}

class FailureLoginState extends LoginState {
  final String? error;
  FailureLoginState({this.error});
}

class DeleteLoginState extends LoginState {}
