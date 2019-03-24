import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({ Key key }) : super(key: key);
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<RandomPage> with SingleTickerProviderStateMixin {
  List<Tab> myTabs = <Tab>[];
  TabController _tabController;

  @override
  void initState() {
    getData().then((rows){
      setData(rows).then((tabs){
        setState(() {
          if (tabs is List<Tab>) {
            print(tabs);
            myTabs = tabs;
            _tabController = TabController(vsync: this, length: myTabs.length);
          }
        });
      });
    });
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    if (myTabs.length > 0) {
      _tabController.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("专辑"),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return Center(child: Text(tab.text));
        }).toList(),
      ),
    );
  }
}

setData(rows) async {
  List<Tab> _myTabs = <Tab>[];
  for (var row in rows) {
    _myTabs.add(Tab(text: row['title']));
  }

  return _myTabs;
}

getData() async {
  var url = 'https://www.imcn.vip/lib/query';
  Response<Map> result =  await Dio().get(url);

  return result.data['data'];
}
