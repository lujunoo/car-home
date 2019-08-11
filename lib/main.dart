import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
// 页面
import "package:page/carInformation/carInformation.dart";
import 'package:page/news/News.dart';
import 'package:page/community/Community.dart';
import 'package:page/find/Find.dart';
import 'package:page/personalInfo/personalInfo.dart';
void main() {
  runApp(new MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// app主页
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 设置主题色
    const MaterialColor blueTheme = MaterialColor(
   0xFF3171f7,
    <int, Color>{
       50: Color(0xFF3171f7),
      100: Color(0xFF3171f7),
      200: Color(0xFF3171f7),
      300: Color(0xFF3171f7),
      400: Color(0xFF3171f7),
      500: Color(0xFF3171f7),
      600: Color(0xFF3171f7),
      700: Color(0xFF3171f7),
      800: Color(0xFF3171f7),
    },
  );
    return new MaterialApp(
      theme: ThemeData(
         primarySwatch:blueTheme,
          primaryColor: Colors.grey[100],
          primaryColorBrightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      // title: 'test demo',
      // home: VideoWidget(),
      home: BottomTabBar(),
    );
  }
}

// app主页的底部导航栏
class BottomTabBar extends StatefulWidget {
  @override
  _BottomTabBarState createState() => new _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int selectIndex = 0;
  var _body = [
    new CarInformation(),
    new News(),
    new Find(),
    new Community(),
    new PersonalInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, //导航栏和状态栏的的颜色
      body: IndexedStack(
        children: _body,
        index: selectIndex,
      ),
      // drawer: new MyDrawer(), //抽屉,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe61d, fontFamily: 'iconfont')),
            title: Text('选车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe604, fontFamily: 'iconfont')),
            title: Text('资讯'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe62a, fontFamily: 'iconfont')),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe60e, fontFamily: 'iconfont')),
            title: Text('社区'),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe60d, fontFamily: 'iconfont')),
            title: Text('我的'),
          ),
        ],
        //默认选中当前的tabBar位置
        currentIndex: selectIndex,
        fixedColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.fixed,
        //处理tabBar的点击事件
        onTap: (int index) {
          setState(() {
            selectIndex = index;
          });
        },
      ),
    );
  }
}
