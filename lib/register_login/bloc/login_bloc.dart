import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srsp4/register_login/bloc/login_event.dart';
import 'package:srsp4/register_login/bloc/login_state.dart';
import 'package:srsp4/register_login/resources/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository = LoginRepository();

  LoginBloc() : super(LoginInitial()) {
    on<LocaleInitLoginEvent>((event, emit) {
      _repository.onLocaleInitLoginEvent(event, emit);
    });
    on<LoginStartedEvent>((event, emit) {
      _repository.onLoginStartedEvent(event, emit);
    });
    on<UserAuthedLoginEvent>((event, emit) {
      _repository.onUserAuthedLoginEvent(event, emit);
    });
  }
}
