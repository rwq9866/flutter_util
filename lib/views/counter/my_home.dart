import 'package:flutter/material.dart';
import 'package:flutterutil/views/counter/demo.dart';
import 'package:flutterutil/views/counter/new_route.dart';
import 'package:flutterutil/views/counter/tab_one.dart';
import 'package:flutterutil/views/counter/tab_three.dart';
import 'package:flutterutil/views/counter/tab_two.dart';
import 'package:flutterutil/views/counter/tip_route.dart';
import 'package:vibrate/vibrate.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  void _incrementCounter(){
    setState(() {
      if(_counter == 2) _counter = -1;
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this
    );

    _tabController.addListener((){
          switch(_tabController.index){
            case 1: new NewRoutePage(demo: 2,);
//            case 2:new TipRoutePage(text: "demo");

          }
        }
    );
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

        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),

        bottom: TabBar(   //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        ),

        centerTitle: true,

      ),

      // 顶部导航栏左侧抽屉
//      drawer: new NewRoutePage(demo: 8),

      // 页面右下角悬浮按钮
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '不要一直点着我',
        child: new Icon(Icons.add),
      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('测试')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我')),
        ],
        currentIndex: _counter,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),

//      bottomNavigationBar: BottomAppBar(
//        color: Colors.white,
//        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
//        child: Row(
//          children: [
//            IconButton(
//                icon: Icon(Icons.home),
//
//            ),
//            SizedBox(), //中间位置空出
//            IconButton(icon: Icon(Icons.business)),
//          ],
//          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
//        ),
//
//      ),

//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              "点击次数",
//            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline,
//            ),
//            FlatButton(
//              child: new Text("跳转新页面..."),
//              textColor: Colors.blue,
//              onPressed: (){
//                Navigator.push(context,
//                  MaterialPageRoute(
//                    builder: (context){
//                      return NewRoutePage(demo: _counter,);
//                    },
//                    fullscreenDialog: true,
//                  ),
//                );
//              },
//            ),
//          ],
//        ),
//      ),

    body: tabPage(),

    );
  }

  Widget tabPage(){
    return TabBarView(
      controller: _tabController,
      children: tabs.map((e) { //创建3个Tab页
        return (e == "新闻"? new TabOnePage():(e == "历史"? new TabTwoPage(): new Example01()));
      }).toList(),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _counter = index;
      Vibrate.vibrate(); // 震动反馈
    });
  }


}