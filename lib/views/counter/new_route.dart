import 'package:flutter/material.dart';

class NewRoutePage extends StatelessWidget {

  NewRoutePage({
    Key key, @required this.demo,
  }) : super(key : key);

  final int demo;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "新路由",
        ),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Text("新路由---页面!!!"),
          ],
        ),
      ),
    );
  }
}