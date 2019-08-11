import 'package:flutter/material.dart';
// 视频播放器组件
import 'package:page/components/video.dart';
import 'package:page/components/videoDetail.dart';
import 'package:page/components/newDetail.dart';

// 视频播放的Item
class VideoItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _VideoItem();
  }
}

class _VideoItem extends State<VideoItem> {
  _toDetail() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new ViodeDetail();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toDetail,
      child: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 标题
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "这是视频播放这是视频播放这是视频播放",
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(35, 35, 35, 1)),
              ),
            ),
            // 视频播放器
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: new VideoWidget(),
            ),
           
            // 作者
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'http://imagecn.gasgoo.com/moblogo/News/UEditor/image/20180809/6366942820085998194660746.jpg',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "卢大爷",
                            style: TextStyle(
                                color: Color.fromRGBO(35, 35, 35, 1),
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: Colors.black26,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "123",
                            style: TextStyle(
                                color: Color.fromRGBO(35, 35, 35, 1),
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          color: Colors.black26,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "123",
                            style: TextStyle(
                                color: Color.fromRGBO(35, 35, 35, 1),
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera,
                          color: Colors.black26,
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            "分享",
                            style: TextStyle(
                                color: Color.fromRGBO(35, 35, 35, 1),
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Divider(
                height: 1,
                color: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
