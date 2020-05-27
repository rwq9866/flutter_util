import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutterutil/views/counter/bar_one.dart';
import 'package:flutterutil/views/counter/bar_three.dart';
import 'package:flutterutil/views/counter/bar_two.dart';
import 'package:flutterutil/views/counter/home_drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // 底部导航栏bar -- start --
  int _currentIndex;
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('测试')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我')),
  ];
  final pages = [
    BarOnePage(),BarTwoPage(),BarThreePage(),
  ];
  // 底部导航栏 -- end --

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 顶部导航栏
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){

            },
          ),
        ],

        // 自定义顶部导航栏左侧抽屉
//        leading: Builder(builder: (context) {
//          return IconButton(
//            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
//            onPressed: () {
//              // 打开抽屉菜单
//              Scaffold.of(context).openDrawer();
//            },
//          );
//        }),

        centerTitle: true, // 标题居中 默认居左
      ),

      // 顶部导航栏左侧抽屉
      drawer: new MyDrawer(),

      // 页面右下角悬浮按钮
      floatingActionButton: new FloatingActionButton(
        onPressed: _openBlog,
        tooltip: '写博客啦!',
        child: new Icon(Icons.add),
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: bottomNavItems,
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: _onChangePage,
      ),

    body: pages[_currentIndex],
    );
  }


  // bar页面切换
  void _onChangePage(int index) {
    if(index != _currentIndex){
      setState(() {
        _currentIndex = index;
//        Vibrate.vibrate(); // 震动反馈
      });
    }
  }



  void _openBlog() {
    print("demo");
  }
}