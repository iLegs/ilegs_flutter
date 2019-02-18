import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/album.dart';
import '../pages/random.dart';
import '../pages/user.dart';


class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.deepPurple;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(HomePage())
      ..add(AlbumPage())
      ..add(RandomPage())
      ..add(UserPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.refresh,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '最近更新',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_library,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '专辑列表',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.all_inclusive,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '随机一下',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '个人中心',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}