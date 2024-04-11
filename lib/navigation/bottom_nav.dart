import 'package:flutter/material.dart';
import 'package:srsp4/constants/text_style.dart';
import 'package:srsp4/model/user.dart';
import 'package:srsp4/pages/first_page.dart';
import 'package:srsp4/pages/fourth_page.dart';
import 'package:srsp4/json_page/second_page.dart';
import 'package:srsp4/pages/third_page.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  User newUser = User();
  int pageIndex = 0;
  final pages = [
    const FirstPage(),
    SecondPage(
      postId: 1,
    ),
    ThirdPage(),
    const FourthPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Instunder",
          style: TextLogo.instunder,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                      Icons.home_filled,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      color: Colors.grey,
                      size: 35,
                    )),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 35,
                    )),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.message_outlined,
                      color: Colors.grey,
                      size: 35,
                    )),
          IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                      Icons.person_4,
                      color: Colors.white,
                      size: 35,
                    )
                  : const Icon(
                      Icons.person_4_outlined,
                      color: Colors.grey,
                      size: 35,
                    )),
        ],
      ),
    );
  }
}
