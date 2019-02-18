import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("iLegs"),
      ),
      body: new Center(
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
        },
        tooltip: '长按展示文字',
        child: new Icon(Icons.add),
        foregroundColor: Colors.white,//设置显示图标或者文本的颜色//前提是子child没有设置
        backgroundColor: Colors.deepPurple,//设置按钮的背景色
      ),
     );
  }
}