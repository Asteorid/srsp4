import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srsp4/register_login/bloc/login_event.dart';
import 'package:srsp4/register_login/bloc/login_state.dart';
import 'package:srsp4/services/shared_pref.dart';

class LoginRepository {
  Future<void> onLocaleInitLoginEvent(
      LocaleInitLoginEvent event, Emitter<LoginState> emit) async {
    if (await sharedPreference.authStatus == false) {
      emit(LocaleInitLoginState());
    } else {
      await onLoginStartedEvent(LoginStartedEvent(), emit);
    }
  }

  Future<void> onLoginStartedEvent(
      LoginStartedEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());
    if (await isAuthenticated()) {
      emit(AuthLoginState());
      sharedPreference.saveAuthStatus(true);
    } else {
      emit(UnAuthLoginState());
    }
  }

  Future<void> onUserAuthedLoginEvent(
      UserAuthedLoginEvent event, Emitter<LoginState> emit) async {
    emit(AuthLoginState());
  }

  Future<bool> isAuthenticated() async {
    return true;
  }
}
