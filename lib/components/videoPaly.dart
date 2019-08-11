import 'package:flutter/material.dart';
import 'package:page/components/comment.dart';
import 'package:video_player/video_player.dart';

// 小视频播放组件
class VideoPaly extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _VideoPaly();
  }
}

class _VideoPaly extends State<VideoPaly> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(70, 70, 70, 1),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: SetVideoData(),
              ),
              Seting(),
              BotttomContent(),
              RightMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

//视频播放操作
class SetVideoData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SetVideoData();
  }
}

class _SetVideoData extends State<SetVideoData> {
  VideoPlayerController _controller;
  final bool _offstage=false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://qvod.yiche.com/da39c774vodtranscq1251489075/d40854585285890787324811876/v.f30.mp4?d40854585285890787324811876')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
    _controller.setLooping(true);
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: _controller.value.initialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                : Container(
              alignment: Alignment.bottomLeft,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white30),
                backgroundColor: Colors.white30,
              ),
            ),
          ),
          new Offstage(
            offstage:_controller.value.isPlaying,
            child:new GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });

              },
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      width: 4,
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 80,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ) ;
  }
}

//头部操作项
class Seting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Positioned(
      left: 10,
      right: 10,
      top: 10,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(child: Text('')),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.grade,
                                  size: 30,
                                  color: Colors.black12,
                                ),
                                Text(
                                  "收藏",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.cancel,
                                  size: 30,
                                  color: Colors.black12,
                                ),
                                Text(
                                  "不感兴趣",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.warning,
                                  size: 30,
                                  color: Colors.black12,
                                ),
                                Text(
                                  "举报",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.library_books,
                                  size: 28,
                                  color: Colors.black12,
                                ),
                                Text(
                                  "复制链接",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

//底部内容
class BotttomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Positioned(
      left: 10,
      right: 10,
      bottom: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "@用户名",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Text(
            "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

//右边菜单功能
class RightMenu extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Positioned(
      top: 10,
      right: 10,
      bottom: 120,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ClipOval(
              child: Image(
                image: AssetImage("images/head.png"),
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Icon(
            Icons.videocam,
            color: Colors.white,
          ),
          new Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "跟拍",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "234",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return new Container(
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {},
                              ),
                              Expanded(
                                child: Text("213条评论"),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black12,
                          ),
                          Expanded(
                            child: ListView(
                              children: <Widget>[
                                Comment(),
                                Comment(),
                                Comment(),
                                Comment(),
                              ],
                            ),
                          ),
                          new Container(
                            color: Color.fromRGBO(240, 240, 240, 1),
                            height: 50,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                    height: 35,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: TextField(
                                      controller: textEditingController,
                                      autofocus: false, //自动获取输入框焦点
                                      decoration: InputDecoration(
                                          hintText: "我来说两句",
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.only(top: 3)),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.insert_comment,
              color: Colors.white,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "234",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image(
                                    image: AssetImage("images/qq.png"),
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "QQ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image(
                                    image: AssetImage("images/kj.png"),
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "QQ空间",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image(
                                    image: AssetImage("images/wx.png"),
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "微信",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image(
                                    image: AssetImage("images/pyq.png"),
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "朋友圈",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipOval(
                                  child: Image(
                                    image: AssetImage("images/xt.png"),
                                    width: 35,
                                    height: 35,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "系统分享",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: 22,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "分享",
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
