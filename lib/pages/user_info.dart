import 'package:flutter/material.dart';
import 'package:srsp4/constants/text_style.dart';
import '/model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;
  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

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
                userInfo.name,
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
                userInfo.secondName,
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
                userInfo.email,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                userInfo.phone,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: const Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                userInfo.country,
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
