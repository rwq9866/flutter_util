import 'package:flutter/material.dart';
import 'package:flutterutil/utils/Constants.dart';
import 'package:flutterutil/views/counter/my_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: ThemeData(
        primarySwatch: Constants.THEME_COLOR,
      ),
      color: Colors.black,
      home: MyHomePage(title: '首页'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  int _counter = 0;
  Color _themeColor = Colors.teal;//当前主题颜色

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counter % 2 == 0?_themeColor = Colors.blue:_themeColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data:ThemeData(
            primarySwatch: _themeColor,//用于导航栏。floatingActionButton
            iconTheme: IconThemeData(color: _themeColor)//用于icon颜色
        ),
        child:Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '计数器',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: '能不能别一直点着我...',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
    );
  }
}
