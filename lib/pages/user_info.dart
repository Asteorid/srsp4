import 'package:flutter/material.dart';
import '/model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;
  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                userInfo.name,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.person_4_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                userInfo.secondName,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.person_4,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                userInfo.email,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.email,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                userInfo.phone,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                userInfo.country,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              leading: Icon(
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
