import 'package:flutter/material.dart';
import 'package:srsp4/model/user.dart';
import 'user_info.dart';
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
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  final _nameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final List<String> _countries = [
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
        title: Text('Registration Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _secondNameFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'What is your name?',
                prefixIcon: Icon(Icons.person_4_sharp),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _nameController.clear();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              validator: validateName,
              onSaved: (Value) => newUser.name = Value!,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _secondNameFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _secondNameFocus, _emailFocus);
              },
              controller: _secondNameController,
              decoration: InputDecoration(
                labelText: 'Second Name',
                hintText: 'What is your second name',
                prefixIcon: Icon(Icons.person_4_sharp),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _secondNameController.clear();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              validator: validateSecondName,
              onSaved: (newValue) => newUser.secondName = newValue!,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _emailFocus,
              onFieldSubmitted: (value) {
                _fieldFocusChange(context, _emailFocus, _passwordFocus);
              },
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _emailController.clear();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => newUser.email = newValue!,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _passwordFocus,
              controller: _passwordController,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Create password',
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
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
            SizedBox(height: 10),
            TextFormField(
              focusNode: _confirmPasswordFocus,
              controller: _confirmPasswordController,
              obscureText: _hidePass,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm the password',
                icon: Icon(Icons.border_color),
              ),
              validator: validatePassword,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: 'Country'),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
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
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_selectedCountry.isEmpty) {
        _selectedCountry = 'Kazakhstan';
      }
      _showDialog(name: _nameController.text);
      log('Name: ${_nameController.text}');
      log('Second Name: ${_secondNameController.text}');
      log('Email: ${_emailController.text}');
      log('Country: $_selectedCountry');
    } else {
      _showMessage(message: 'Form is not valid! Please review and correct');
    }
  }

  String? validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Name is required.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  String? validateSecondName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Second name is required.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  String? validateEmail(
    String? value,
  ) {
    if (value == null) {
      return 'Cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (_passwordController.text.length != 10) {
      return '10 character required for password';
    } else if (_confirmPasswordController.text != _passwordController.text) {
      return 'Password doesnt match';
    } else {
      return null;
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
        ),
      ),
    ));
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registration successful',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          content: Text(
            '$name is now a verified register form',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(
                      userInfo: newUser,
                    ),
                  ),
                );
              },
              child: const Text(
                'Verified',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
