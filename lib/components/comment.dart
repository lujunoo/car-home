import 'package:flutter/material.dart';

// 评论组件拆分
// class Comment extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return new _Comment();
//   }
// }

class Comment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConmentTitle(),
            ConmentContent(),
            // 用户信息标题
          ],
        ),
      ),
    );
  }
}

// 评论标题
class ConmentTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              "http://img3.bitautoimg.com/autoalbum/files/20140903/372/15253137244914_3589582_14.jpg",
              fit: BoxFit.cover,
              width: 35,
              height: 35,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: Text(
                  "卢大爷的名字卢大爷",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              Text(
                "2019-11-21",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                size: 20,
                color: Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text("234"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

// 内容显示区
class ConmentContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 40, top: 10),
            child: Text(
              "这是评论内容这是评论内容这是评论内容这是评论内容这是评论内容这是评论内容",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            margin: EdgeInsets.only(left: 40, top: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children:
               <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "请叫我卢大爷: ",style: TextStyle(color: Colors.blue),),
                        TextSpan(
                          text: "回复楼上的傻逼回复楼上的傻逼回复楼上的傻逼",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "请叫我卢大爷: ",style: TextStyle(color: Colors.blue),),
                        TextSpan(
                          text: "回复楼上的傻逼回复楼上的傻逼回复楼上的傻逼",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "请叫我卢大爷: ",style: TextStyle(color: Colors.blue),),
                        TextSpan(
                          text: "回复楼上的傻逼回复楼上的傻逼回复楼上的傻逼",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
