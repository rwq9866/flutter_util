import 'package:flutter/material.dart';
import 'package:flutterutil/common/funs.dart';

class BlogItem extends StatefulWidget {
  BlogItem({Key key}) : super(key: key);
    
  @override
  _BlogItemState createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {
  @override
  Widget build(BuildContext context) {
    var subtitle;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                dense: true,
                leading: gmAvatar(
                  //项目owner头像
                  "images/timg.png",
                  width: 24.0,
                  borderRadius: BorderRadius.circular(12),
                ),
                title: Text(
                  "muyou",
                  textScaleFactor: .9,
                ),
                subtitle: subtitle,
                trailing: Text("java" ?? ""),
              ),
              // 构建项目标题和简介
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hello-World",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 12),
                      child: Text(
                        "我就是来测试测试这个功能",
                        maxLines: 3,
                        style: TextStyle(
                          height: 1.15,
                          color: Colors.blueGrey[700],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // 构建卡片底部信息
              _buildBottom()
            ],
          ),
        ),
      ),
    );
  }

  // 构建卡片底部信息
  Widget _buildBottom() {
    const paddingWidth = 10;
    return IconTheme(
      data: IconThemeData(
        color: Colors.grey,
        size: 15,
      ),
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.grey, fontSize: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            var children = <Widget>[
              Icon(Icons.share),
              Text(" " + 80.toString().padRight(paddingWidth)),

              Icon(Icons.comment),
              Text(" " + 2.toString().padRight(paddingWidth)),

              Icon(Icons.favorite_border), //我们的自定义图标
              Text(9.toString().padRight(paddingWidth)),
            ];

//            if (true) {
//              children.add(Text("Forked".padRight(paddingWidth)));
//            }

//            if (true) {
//              children.addAll(<Widget>[
//                Icon(Icons.lock),
//                Text(" private".padRight(paddingWidth))
//              ]);
//            }
            return Row(children: children);
          }),
        ),
      ),
    );
  }
}
