import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TabThreePage extends StatefulWidget {
  TabThreePage({Key key}) : super(key: key);

  @override
  _TabThreePageState createState() => _TabThreePageState();
}

class _TabThreePageState extends State<TabThreePage> {

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => new Container(
          color: Colors.green,
          child: new Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}