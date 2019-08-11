import 'package:flutter/material.dart';
import 'package:page/message/charPage.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Message();
  }
}

class _Message extends State<Message> with SingleTickerProviderStateMixin {
  TabController mController;
  @override
  void initState() {
    super.initState();
    mController = new TabController(
        vsync: this, //动画效果的异步处理，默认格式，背下来即可
        length: 2//需要控制的Tab页数量
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: new SafeArea(
        child:  Column(
          children: <Widget>[
           new Container(
              color: Colors.white,
              child: new TabBar(
                controller: mController, //配置控制器
                tabs: <Widget>[
                  Tab(
                    text: '消息',
                  ),
                  Tab(
                    text: '车型群聊',
                  ),
                ],
                indicatorWeight: 3, //指示器的厚度
                labelColor: Colors.black, //选择字体的颜色
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ), //
                unselectedLabelColor: Colors.black38, //未选中字体的颜色
                unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ), //未选择字体的样式
                indicatorColor: Colors.red, //tab标签的下划线颜色
              ),
            ),
            new Expanded(
              child: TabBarView(
                //TabBarView呈现内容，因此放到Scaffold的body中
                controller: mController, //配置控制器
                children: [
                  MessagCenter(),
                  CarGroupchat(),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

// 消息列表
class MessagCenter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 50,
      itemBuilder: (context, index) {
        return new InkWell(
          onTap:(){
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return new CharPage();
            }));
          },
          child:Column(
            children: <Widget>[
              new ListTile(
                leading:new Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: <Widget>[
                      ClipOval(
                        child: Image(
                          image: AssetImage("images/head.png"),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100)),
                          child: Text(
                            "11",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title:new Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "哈哈哈哈哈哈哈哈",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child:Text(
                          '03-20',
                          style: TextStyle(fontSize: 12, color: Colors.black26),
                        ) ,
                      ),

                    ],
                  ),
                ),
                subtitle: Text(
                  "风格化风格化和风格化风格化",
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10),child:new Divider(color: Colors.black12,height: 1,) ,)

            ],
          ) ,
        );

      },
    );
  }
}
//车型群聊
class CarGroupchat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 50,
      itemBuilder: (context, index) {
        return new InkWell(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return new CharPage();
            }));
          },
          child:Column(
            children: <Widget>[
              new ListTile(
                leading:new Container(
                  margin: EdgeInsets.only(top: 10),
                  child:ClipOval(
                    child: Image(
                      image: AssetImage("images/head.png"),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title:new Padding(
                  padding: EdgeInsets.only(top:5,bottom: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "奔驰GLE车型群聊",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Text(
                  "23452人正在参与群聊",
                  style: TextStyle(fontSize: 14, color: Colors.black38),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10),child:new Divider(color: Colors.black12,height: 1,) ,)

            ],
          ) ,
        );

      },
    );
  }
}

