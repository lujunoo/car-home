import 'package:flutter/material.dart';
// 文章组件
import 'package:page/components/article.dart';
// 评论组件
import 'package:page/components/comment.dart';
// 发表评论
import 'package:page/components/videoDetail.dart';

// 新闻详情
class NewDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                "http://img3.bitautoimg.com/autoalbum/files/20140903/372/15253137244914_3589582_14.jpg",
                fit: BoxFit.cover,
                width: 35,
                height: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "卢大爷",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Chip(
                backgroundColor: Colors.blue,
                label: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18,
                    ),
                    Text(
                      "关注",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                )),
          ),
        ],
      ),
      body: NewDetailPage(),
      bottomNavigationBar: BottomAppBar(
        child: BottomAppBarList(),
      ),
    );
  }
}

// 详情页面组合
class NewDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          new DetailTitle(),
          new DetailInfo(),
          new Evaluation(),
          new Suggestion(),
          new CommentList(),
        ],
      ),
    );
  }
}

// 详情标题
class DetailTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 10, left: 15, bottom: 0, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
          Text(
            "2019-04-11 12:21:32",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          )
        ],
      ),
    );
  }
}

// 富文本占位
class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.black12),
      alignment: Alignment.center,
      child: Text("这是富文本内容"),
    );
  }
}

// 点赞
class Evaluation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Chip(
          padding: EdgeInsets.only(left: 5),
          avatar: Icon(
            Icons.thumb_up,
            size: 20,
            color: Colors.black26,
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          label: Text("赞2354"),
        ),
        Chip(
          padding: EdgeInsets.only(left: 5),
          avatar: Icon(
            Icons.thumb_up,
            size: 20,
            color: Colors.black26,
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          label: Text("踩2354"),
        )
      ],
    );
  }
}

// 相关推荐
class Suggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "相关推荐",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.w900),
          ),
        ),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
        ArticleItem(),
      ],
    );
  }
}

// 评论区
class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new ListTile(
          title: Text(
            "热门评论",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900, color: Colors.black87),
          ),
        ),
        new Comment(),
        new Comment(),
        new Comment(),
        new Comment(),
        new Comment(),
      ],
    );
  }
}
