import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srsp4/constants/colors.dart';
import 'package:srsp4/constants/text_style.dart';
import 'package:srsp4/generated/locale_keys.g.dart';
import 'package:srsp4/model/user.dart';
import 'package:srsp4/pages/bottom_nav.dart';
import 'dart:developer';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  _RegisterFormPage createState() => _RegisterFormPage();
}

class _RegisterFormPage extends State<RegisterFormPage> {
  bool _hidePass = true;

  User newUser = User();

  final _formKey = GlobalKey<FormState>();

  final _nameFocus = FocusNode();
  final _secondNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  final _nameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final List<String> countries = [
    'Kazakhstan',
    'Russia',
    'Kyrgyzstan',
    'Uzbekistan'
  ];
  String _selectedCountry = 'Kazakhstan';

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.registration_form.tr(),
            style: AppText.texxt,
          ),
          centerTitle: true,
          actions: [
            DropdownButton<Locale>(
              value: context.locale,
              onChanged: (newlocale) {
                context.setLocale(newlocale!);
              },
              items: context.supportedLocales.map((Locale locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode.toUpperCase()),
                );
              }).toList(),
            ),
          ],
        ),
        body: Builder(builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  focusNode: _nameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _nameFocus, _secondNameFocus);
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.name.tr(),
                    hintText: LocaleKeys.what_is_your_name.tr(),
                    prefixIcon: const Icon(Icons.person_4_sharp,
                        color: AppColors.icons),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _nameController.clear();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  validator: validateName,
                  onSaved: (newValue) => newUser.secondName = newValue!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  focusNode: _secondNameFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _secondNameFocus, _emailFocus);
                  },
                  controller: _secondNameController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.second_name.tr(),
                    hintText: LocaleKeys.what_is_your_second_name.tr(),
                    prefixIcon: const Icon(Icons.person_4_sharp,
                        color: AppColors.icons),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _secondNameController.clear();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  validator: validateSecondName,
                  onSaved: (newValue) => newUser.secondName = newValue!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  focusNode: _emailFocus,
                  onFieldSubmitted: (value) {
                    _fieldFocusChange(context, _emailFocus, _passwordFocus);
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.email.tr(),
                    prefixIcon: const Icon(Icons.email, color: AppColors.icons),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _emailController.clear();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => newUser.email = newValue!,
                ),
                TextFormField(
                  focusNode: _phoneFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _phoneFocus, _passwordFocus);
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.your_phone.tr(),
                    hintText: '(###)###-####',
                    prefixIcon: const Icon(Icons.phone, color: AppColors.icons),
                    suffixIcon: GestureDetector(
                      onLongPress: () {
                        _phoneController.clear();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                        allow: true)
                  ],
                  validator: (value) => validatePhoneNumber(value!)
                      ? null
                      : LocaleKeys.phone_number_must_be_entered_as.tr(),
                  onSaved: (newValue) => newUser.phone = newValue!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  focusNode: _passwordFocus,
                  controller: _passwordController,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.password.tr(),
                    hintText: LocaleKeys.create_password.tr(),
                    helperText: LocaleKeys
                        .one_digit_the_first_letter_of_the_password_must_be_capitalized
                        .tr(),
                    prefixIcon:
                        const Icon(Icons.password, color: AppColors.icons),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _hidePass ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                    ),
                  ),
                  validator: validatePassword,
                  obscureText: _hidePass,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  focusNode: _confirmPasswordFocus,
                  controller: _confirmPasswordController,
                  obscureText: _hidePass,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.confirm_password.tr(),
                    hintText: LocaleKeys.confirm_password.tr(),
                    icon:
                        const Icon(Icons.border_color, color: AppColors.icons),
                  ),
                  validator: validatePassword,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      icon: const Icon(Icons.map, color: AppColors.icons),
                      labelText: LocaleKeys.country.tr()),
                  items: countries.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(tr(country)),
                    );
                  }).toList(),
                  onChanged: (country) {
                    setState(() {
                      _selectedCountry = country as String;
                      newUser.country = country;
                    });
                  },
                  value: _selectedCountry,
                ),
                const SizedBox(height: 70),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.done,
                  ),
                  child: Text(
                    LocaleKeys.register.tr(),
                    style: const TextStyle(color: AppColors.textColor),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_selectedCountry.isEmpty) {
        _selectedCountry = LocaleKeys.countries.tr();
      }
      _showDialog(name: _nameController.text);
      log('Name: ${_nameController.text}');
      log('Second Name: ${_secondNameController.text}');
      log('Email: ${_emailController.text}');
      log('Country: $_selectedCountry');
    } else {
      _showMessage(
          message: LocaleKeys.form_is_not_valid_please_review_and_correct.tr());
    }
  }

  String? validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return LocaleKeys.name_is_required.tr();
    } else if (!nameExp.hasMatch(value)) {
      return LocaleKeys.please_enter_alphabetical_characters.tr();
    } else {
      return null;
    }
  }

  String? validateSecondName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return LocaleKeys.second_name_is_required.tr();
    } else if (!nameExp.hasMatch(value)) {
      return LocaleKeys.please_enter_alphabetical_characters.tr();
    } else {
      return null;
    }
  }

  String? validateEmail(
    String? value,
  ) {
    if (value == null) {
      return LocaleKeys.cannot_be_empty.tr();
    } else if (!_emailController.text.contains('@')) {
      return LocaleKeys.invalid_email_address.tr();
    } else {
      return null;
    }
  }

  bool validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.password_required.tr();
    } else {
      String password = value;
      if (password.length != 10) {
        return LocaleKeys.password_length_must_be_characters.tr();
      } else if (!RegExp(r'\d').hasMatch(password)) {
        return LocaleKeys.the_password_must_retain_at_least_one_digit.tr();
      } else if (!RegExp(r'[A-Z]').hasMatch(password.substring(0, 1))) {
        return LocaleKeys.the_first_letter_of_the_password_must_be_capitalized;
      } else if (_confirmPasswordController.text != password) {
        return LocaleKeys.password_doesnt_match;
      }
    }
    return null;
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: AppColors.error,
      content: Text(message, style: AppText.texxt),
    ));
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(LocaleKeys.registration_successful.tr(),
              style: TextDone.done),
          content:
              Text('$name is now a verified register', style: AppText.texxt),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomBarPage(),
                  ),
                );
              },
              child: Text(LocaleKeys.verified.tr(), style: TextDone.done),
            ),
          ],
        );
      },
    );
  }
}
