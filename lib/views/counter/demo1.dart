import 'package:flutter/material.dart';

class demo1Page extends StatefulWidget {
  demo1Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _demo1PageState createState() => _demo1PageState();
}

class _demo1PageState extends State<demo1Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}