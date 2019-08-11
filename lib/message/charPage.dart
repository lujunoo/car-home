import 'package:flutter/material.dart';

// 聊天的详情页面
class CharPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CharPage();
  }
}

class _CharPage extends State<CharPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("宝马M6群聊"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
          ],
        ),
        body:new Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(30, 144, 255, 0.2),
                  Color.fromRGBO(127, 255, 212, 0.2)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: <Widget>[
              ChartList(),
              SendMessage(),
            ],
          ),
        ),
      ),
    );
  }
}

// 聊天消息记录列表
class ChartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Expanded(
      child: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return ListTile(
                leading: ClipOval(
                  child: Image(
                    image: AssetImage("images/head.png"),
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "标题$index",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                    // 占位符
                    SizedBox(
                      width: 54,
                    )
                  ],
                ),
              );
            } else {
              return ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "标题$index",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54),
                    ),
                  ),
                ),
                subtitle: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 54,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题小标题",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: ClipOval(
                  child: Image(
                    image: AssetImage("images/head.png"),
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// 发送消息
class SendMessage extends StatelessWidget {
  // 输入框控制器实例
  TextEditingController _selectionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.all(8),
//      color: Color.fromRGBO(248 ,248 ,255,1),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left:10,right: 10,top: 5,bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                autofocus: false, //自动获取输入框焦点
                controller: _selectionController,
                decoration: InputDecoration(
                    hintText: "我来说两句", 
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 5)
                ),

              ),
            ),
          ),
          IconButton(icon: Icon(Icons.add_circle,size: 28,color: Colors.blueAccent,), onPressed: (){}),
          IconButton(icon: Icon(Icons.send,size: 28,color: Colors.blueAccent,), onPressed: (){}),
        ],
      ),
    );
  }
}
