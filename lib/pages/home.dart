import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("iLegs 最新发布专辑"),
            backgroundColor: Colors.deepPurple
        ),
        body: new HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new GridViewState();
}

class GridViewState extends State {
  @override
  Widget build(BuildContext context) => new GridView.count(
      primary: false,
      padding: const EdgeInsets.only(top: 2.0),
      mainAxisSpacing: 2.0,//竖向间距
      crossAxisCount: 2,//横向Item的个数
      crossAxisSpacing: 2.0,//横向间距
      childAspectRatio: 2/3,
      children: buildGridTileList(50));

  List<Widget> buildGridTileList(int number) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < number; i++) {
      widgetList.add(getItemWidget());
    }
    return widgetList;
  }
  String url = "http://leg.imcn.vip/cover/20190215/5c66e59e95ae9.jpg-mobile_cover?e=1550565906&token=u6UtZg2ym_yzh2DfwJb4gRDwMqg-7oxG_eVtqP2w:aI_kq3NzyxMuPLg5L1LGpGdX7Jw=";
  Widget getItemWidget() {
    //BoxFit 可设置展示图片时 的填充方式
    return new Image(image: new NetworkImage(url), fit: BoxFit.cover);
  }
}
