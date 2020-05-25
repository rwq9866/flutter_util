import 'package:flutter/material.dart';
import 'package:flutterutil/views/counter/new_route.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "点击次数",
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline,
            ),
            FlatButton(
              child: new Text("跳转新页面..."),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context){
                      return NewRoutePage(demo: _counter,);
                    },
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '不要一直点着我',
        child: new Icon(Icons.add),
      ),
    );
  }
}