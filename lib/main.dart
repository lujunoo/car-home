import 'package:flutter/material.dart';
import "package:page/carInformation/carInformation.dart";
import 'package:page/home/home.dart';
import 'package:page/message/message.dart';
import 'package:page/tool/tool.dart';
import 'package:page/personalInfo/personalInfo.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main(){
  runApp(new MyApp());
  if(Platform.isAndroid) {
  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  // SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

// app主页
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
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
    
    new Home(),
    new Message(),
    new CarInformation(),
    new Tool(),
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
              icon: Icon(Icons.data_usage), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.alternate_email), title: Text('消息')),
          BottomNavigationBarItem(
              icon: Icon(Icons.drive_eta), title: Text('选车')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('工具')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('我的')),
        ],
        //默认选中当前的tabBar位置
        currentIndex: selectIndex,
        fixedColor: Color.fromRGBO(245, 70, 65, 1),
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
