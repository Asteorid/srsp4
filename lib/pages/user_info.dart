import 'package:flutter/material.dart';
import 'package:srsp4/constants/text_style.dart';
import 'package:srsp4/register_login/bloc/login_bloc.dart';
import 'package:srsp4/services/shared_pref.dart';
import '/model/user.dart';

class UserInfoPage extends StatefulWidget {
  final User userInfo;
  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late LoginBloc loginBloc;
  String? name = sharedPreference.getName;
  String? secondName = sharedPreference.getSecondName;
  String? email = sharedPreference.getEmail;
  String? phone = sharedPreference.getPhone;
  String? country = sharedPreference.getCountry;

  @override
  void initState() {
    loginBloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Information',
          style: AppText.texxt,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                name ?? "",
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.person_4_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                secondName ?? "",
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.person_4,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                email ?? "",
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                phone ?? "",
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                country ?? "",
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.map,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
