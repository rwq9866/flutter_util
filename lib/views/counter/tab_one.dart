import 'package:flutter/material.dart';
import 'package:flutterutil/widgets/blog_item.dart';
import 'package:infinite_listview/infinite_listview.dart';

class TabOnePage extends StatefulWidget {
  TabOnePage({Key key}) : super(key: key);

  @override
  _TabOnePageState createState() => _TabOnePageState();
}

class _TabOnePageState extends State<TabOnePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar( // 显示进度条
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str.split("")
            //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => BlogItem())
                .toList(),
          ),
        ),
      ),
    );
  }
}