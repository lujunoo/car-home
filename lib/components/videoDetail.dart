import 'package:flutter/material.dart';
// 文章组件
import 'package:page/components/article.dart';
// 评论组件
import 'package:page/components/comment.dart';
// 视频组件
import 'package:page/components/video.dart';

// 视频详情
class ViodeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VideoDetailPage(),
      // 底部
      bottomNavigationBar: BottomAppBar(
        child: BottomAppBarList(),
      ),
    );
  }
}

// 页面底部操作栏
class BottomAppBarList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BottomAppBarList();
  }
}

class _BottomAppBarList extends State<BottomAppBarList> {
  // 输入框控制器实例
  TextEditingController _selectionController = new TextEditingController();
  // 多选框状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                // 打开评论
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      height: 100,
                      color: Colors.white12,
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.black12),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                                autofocus: true, //自动获取输入框焦点
                                controller: _selectionController,
                                decoration: InputDecoration(
                                    hintText: "你输入你的评论",
                                    border: InputBorder.none)),
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: _checkboxSelected,
                                activeColor: Colors.blue,
                                onChanged: (value) {
                                  setState(() {
                                    _checkboxSelected = !value;
                                    print(value);
                                  });
                                },
                              ),
                              Text("同时转发"),
                              IconButton(
                                icon: Icon(Icons.face),
                                onPressed: () {
                                  
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.crop_original),
                                onPressed: () {
                                  return false;
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ).then((val) {
                  print(val);
                });
              },
              child: Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  "我得来说两句",
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 9,
                  right: 9,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Text(
                      "21",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.chat,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 9,
                  right: 9,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Text(
                      "25",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.thumb_up,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera,
              color: Colors.black26,
            ),
          ),
          
        ],
      ),
    );
  }
}

// 详情页面组合
class VideoDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: VideoWidget(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                new VideoTitle(),
                new DetailTitle(),
                new Evaluation(),
                new Suggestion(),
                new CommentList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 视频标题栏
class VideoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
          "http://img3.bitautoimg.com/autoalbum/files/20140903/372/15253137244914_3589582_14.jpg",
          fit: BoxFit.cover,
          width: 35,
          height: 35,
        ),
      ),
      title: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("卢大爷的名字"),
          Chip(
            backgroundColor: Color.fromRGBO(50, 120, 250, 1),
            label: Row(
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  "关注",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
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
      padding: EdgeInsets.only(top: 10, left: 15, bottom: 20, right: 15),
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
            "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          )
        ],
      ),
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
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black87),
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

// 写评论
