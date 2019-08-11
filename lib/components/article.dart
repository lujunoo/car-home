import 'package:flutter/material.dart';
import 'package:page/components/newDetail.dart';

// 新闻，文章，帖子长列表item组件(只显示一张图片的)
class ArticleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ListItem();
  }
}

class _ListItem extends State<ArticleItem> {
  _toDetail() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new NewDetail();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toDetail,
      child: Container(
          margin: EdgeInsets.only(
            top: 15,
            right: 15,
            left: 0,
          ),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "这是文章这是文章这是文章这是文章这是文章",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "作者",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    "2012/11/21",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.red[100],
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: new BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553434243328&di=3af08e403e2ac7d398e156412b44d6ff&imgtype=0&src=http%3A%2F%2Fimg1.mydrivers.com%2Fimg%2F20180912%2F5911e50081c04a8c85a24f3f411b5bbe.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, left: 15),
                child: Divider(
                  height: 1,
                  color: Colors.black12,
                ),
              ),
            ],
          )),
    );
  }
}
