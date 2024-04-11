import 'package:shared_preferences/shared_preferences.dart';

final sharedPreference = UserSharedPref();

class UserSharedPref {
  late SharedPreferences _sharedpreferences;
  static const String SELECTED_LANGUAGE = "selected_language";
  static const String NAME = 'name';
  static const String SECOND_NAME = "secondName";
  static const String EMAIL = "email";
  static const String PHONE = "phone";
  static const String COUNTRY = "country";
  static const String PASSWORD = "password";
  static const String FULLNAME = "fullName";
  static const String AUTH_STATUS = "authStatus";

  init() async {
    _sharedpreferences = await SharedPreferences.getInstance();
  }

  Future<bool> get authStatus async {
    return _sharedpreferences.getBool(AUTH_STATUS) ?? false;
  }

  void saveAuthStatus(bool value) {
    _sharedpreferences.setBool(AUTH_STATUS, value);
  }

  Future<void> saveName(String name) async {
    _sharedpreferences.setString(NAME, name);
  }

  String? get getName {
    return _sharedpreferences.getString(NAME);
  }

  Future<void> saveSecondName(String secondName) async {
    _sharedpreferences.setString(SECOND_NAME, secondName);
  }

  String? get getSecondName {
    return _sharedpreferences.getString(SECOND_NAME);
  }

  Future<void> saveEmail(String email) async {
    _sharedpreferences.setString(EMAIL, email);
  }

  String? get getEmail {
    return _sharedpreferences.getString(EMAIL);
  }

  Future<void> savePhone(String phone) async {
    _sharedpreferences.setString(PHONE, phone);
  }

  String? get getPhone {
    return _sharedpreferences.getString(PHONE);
  }

  Future<void> saveCountry(String country) async {
    _sharedpreferences.setString(COUNTRY, country);
  }

  String? get getCountry {
    return _sharedpreferences.getString(COUNTRY);
  }

  Future<void> saveLanguage(String languageCode) async {
    _sharedpreferences.setString(SELECTED_LANGUAGE, languageCode);
  }

  String? getLanguage() {
    return _sharedpreferences.getString(SELECTED_LANGUAGE);
  }
}
