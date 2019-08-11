import 'package:flutter/material.dart';
// 文章列表item组件
import 'package:page/components/article.dart';
// 图片集合Item组件
import 'package:page/components/pictureCollection.dart';
// 视频播放的Item
import 'package:page/components/videoItem.dart';
import 'dart:convert';

class Recommend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Recommend();
  }
}

// 首页——推荐列表
class _Recommend extends  State<Recommend> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }
  getHttp() async{

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return new VideoItem();
          } else if (index % 3 == 0) {
            return new PictureCollection();
          } else if (index % 4 == 0) {
            return new PictureCollection();
          } else {
            return new ArticleItem();
          }
        },
      ),
    );
  }
}

// 推荐页面widget
class RecommendPage extends StatelessWidget {
  List menu = [
    {
      "title": '销量排行',
      "icon": Icon(
        Icons.assessment,
        size: 34,
        color: Color.fromRGBO(255, 70, 50, 1),
      )
    },
    {
      "title": '快捷选车',
      "icon": Icon(Icons.find_in_page,
          size: 34, color: Color.fromRGBO(50, 120, 250, 1))
    },
    {
      "title": '玩转点评',
      "icon": Icon(Icons.library_books,
          size: 32, color: Color.fromRGBO(255, 70, 50, 1))
    },
    {
      "title": '上市新车',
      "icon": Icon(Icons.card_giftcard,
          size: 34, color: Color.fromRGBO(50, 120, 250, 1))
    },
    {
      "title": '二手车',
      "icon":
          Icon(Icons.repeat, size: 34, color: Color.fromRGBO(255, 70, 50, 1))
    },
    {
      "title": '违章查询',
      "icon": Icon(Icons.find_in_page,
          size: 34, color: Color.fromRGBO(50, 120, 250, 1))
    },
    {
      "title": '油卡充值',
      "icon": Icon(Icons.credit_card,
          size: 32, color: Color.fromRGBO(255, 70, 50, 1))
    },
    {
      "title": '购车计算',
      "icon":
          Icon(Icons.exposure, size: 30, color: Color.fromRGBO(50, 120, 250, 1))
    },
    {
      "title": '福利中心',
      "icon": Icon(Icons.confirmation_number,
          size: 32, color: Color.fromRGBO(255, 70, 50, 1))
    },
    {
      "title": '全部工具',
      "icon": Icon(Icons.dashboard,
          size: 30, color: Color.fromRGBO(50, 120, 250, 1))
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, //横轴三个子widget
          mainAxisSpacing: 10,
          childAspectRatio: 1.0 //宽高比为1时，子widget
          ),
      itemCount: menu.length,
      padding: EdgeInsets.all(25),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              print(menu[index]);
            },
            child: GestureDetector(
              child: Container(
                // color: Colors.red[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    menu[index]['icon'],
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        menu[index]['title'],
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

// 新闻列表
