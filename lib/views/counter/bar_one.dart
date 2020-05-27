import 'package:flutter/material.dart';
import 'package:flutterutil/views/counter/tab_one.dart';
import 'package:flutterutil/views/counter/tab_two.dart';

import 'demo.dart';

class BarOnePage extends StatefulWidget {
  BarOnePage({Key key}) : super(key: key);
    
  @override
  _BarOnePageState createState() => _BarOnePageState();
}

class _BarOnePageState extends State<BarOnePage> with SingleTickerProviderStateMixin{

  // 顶部导航栏tab -- start --
  TabController _tabController; // 需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];
  // 顶部导航栏tab -- end --

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        child:new AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((t) => Tab(text: t,)).toList(),
          ),
        ),
        preferredSize: Size.fromHeight(50),
      ),


      body: tabPage(),
    );
  }

  // tab页面
  Widget tabPage(){
    return TabBarView(
      controller: _tabController,
      children: tabs.map((e) { //创建3个Tab页
        return (e == "新闻"? new TabOnePage():(e == "历史"? new TabTwoPage(): new Example01()));
      }).toList(),
    );
  }
}
