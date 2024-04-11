import 'package:flutter/material.dart';
import 'package:srsp4/model/user.dart';
import 'package:srsp4/pages/user_info.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  User newUser = User();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text(
          'show my info',
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserInfoPage(userInfo: newUser)));
        },
      ),
    );
  }
}
