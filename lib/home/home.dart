import 'package:flutter/material.dart';
import 'package:page/home/recommend.dart';
import 'package:page/home/video.dart';
import 'package:page/home/shortVideo.dart';
import 'package:page/home/newCar.dart';
import 'package:page/home/original.dart';
import 'package:page/home/account.dart';
import 'package:page/home/newEnergy.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _Home();
  }
}
class _Home extends State<Home>  with SingleTickerProviderStateMixin {
  TabController mController;
  // tab选项卡
  final List<Tab>  tabTitle =<Tab>[  
    new Tab(text: '推荐'),
    new Tab(text: '视频'),
    new Tab(text: '小视频'),
    new Tab(text: '新车'),
    new Tab(text: '原创'),
    new Tab(text: '易车号'),
    new Tab(text: '新能源'),
  ];
   void initState() {
    super.initState();
    mController = new TabController(
        vsync: this, //动画效果的异步处理，默认格式，背下来即可
        length: tabTitle.length //需要控制的Tab页数量
    );
  }
    //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    mController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
        appBar:AppBar(
          elevation:0,//导航栏影音
          backgroundColor: Colors.white,//导航栏背景颜色
          leading:Builder(builder:(context){
            return Container(
              padding: EdgeInsets.all(8),
                child: ClipOval(
                child:Image(
                  image: AssetImage("images/head.png"),
                  width: 60,
                  height: 40,
                ),
              ),
            );
          }),//导航栏左侧的widget
          title: Container(
            decoration: BoxDecoration(//背景装饰
                color: Colors.white,
                boxShadow: [ //卡片阴影
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0
                  ) 
                ],
                border: new Border.all(color: Colors.black12,width: 0.5),
                borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.only(top: 8,right:0,bottom: 8,left:0),
            padding: EdgeInsets.only(top:10,bottom: 15,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.search,size: 24,color:Colors.black54,),
                Text("输入搜索内容",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                  
                ),
                
              
              ],
            ),
            // color: Colors.blue[100],
          ),//导航栏中间内容
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.center_focus_weak,color: Colors.black87,size: 30,) ,
            )
           
          ],//导航栏右侧菜单
          bottom: TabBar(
            controller: mController, //配置控制器
            isScrollable: true,//是否可以滚动
            indicatorColor:Color.fromRGBO(245, 70, 65, 1),//指示器颜色
            indicatorWeight:4,//指示器的厚度
            // indicatorSize:TabBarIndicatorSize.label,
            indicatorPadding:EdgeInsets.only(top:5,left: 18,right: 18,bottom: 5),//指示器底部的pandding
            // indicator:,//其他配置
            labelColor:Colors.black,//选择字体的颜色
            labelStyle:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),//选择字体的样式
            unselectedLabelColor:Colors.black38,//未选中字体的颜色
            unselectedLabelStyle:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),//未选择字体的样式
            tabs: tabTitle,
          ),//底部选项卡
        ),
        body:  TabBarView(
          controller: mController, //配置控制器
          children: <Widget>[
            new Recommend(),
            new Video(),
            new ShortVideo(),
            new NewCar(),
            new Original(),
            new Account(),
            new NewEnergy(),
          ],
        ),
       
      );
  }
  
}
