import 'package:flutter/material.dart';
import 'package:flutterutil/views/counter/my_home.dart';

void main() => runApp(CounterMain());

class CounterMain extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用名称
      title: 'Flutter - Counter',
      theme: new ThemeData(
        //蓝色主题
        primarySwatch: Colors.blue,
      ),
      //应用首页路由
      home: new MyHomePage(title: 'Flutter - Counter'),
    );
  }

}
