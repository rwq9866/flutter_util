import 'package:flutter/material.dart';

class TipRoutePage extends StatelessWidget {
  TipRoutePage({Key key,@required this.text}) :super(key:key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("提示."),
        ),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: <Widget>[
                new Text(text),
                RaisedButton(
                  onPressed: () => Navigator.pop(context,"我是返回值"),
                  child: Text("返回"),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
