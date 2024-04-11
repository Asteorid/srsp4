abstract class LoginEvent {}

class LoginStartedEvent extends LoginEvent {}

class UserAuthedLoginEvent extends LoginEvent {}

class LocaleInitLoginEvent extends LoginEvent {}

class LogoutLoginEvent extends LoginEvent {}

class DeleteLoginEvent extends LoginEvent {}
