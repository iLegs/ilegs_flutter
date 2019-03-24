import 'package:flutter/material.dart';
import 'layout/bottom_navigation.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(new ILegsApp());
}

class ILegsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iLegs',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BottomNavigationWidget(),
    );
  }
}
