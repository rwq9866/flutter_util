import 'package:flutter/material.dart';
import 'package:flutterutil/common/funs.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context), //构建抽屉菜单头部
            Expanded(child: _buildMenus(context)), //构建功能菜单
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(context) {
        return GestureDetector(
          child: Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                    // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                    child: Image.asset(
                      "images/timg.png",
                      width: 80,
                    ),
                  ),
                ),
                Text("muyou",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            print("点击了头像");
          },
        );
  }

  // 构建菜单项
  Widget _buildMenus(context) {
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text("换肤"),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text("语言"),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),

          ],
        );
  }
}