import 'package:flutter/material.dart';

// 视频播放的Item
class VideoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _VideoWidget();
  }
}

class _VideoWidget extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.red[100],
          // borderRadius: new BorderRadius.circular(10),
        ),
        child: Stack(
          children: <Widget>[
            // 背景图
             Image(
                  width: double.infinity,
                  image: NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553444604831&di=55078a646aa8fe3529f018943ca1b034&imgtype=0&src=http%3A%2F%2Fm1.autoimg.cn%2Fcardfs%2Fproduct%2Fg16%2FM08%2F48%2F6B%2F1024x0_q87_autohomecar__wKjBx1fbR96AdcuiAAHRLd4WiHk030.jpg"),
                  fit: BoxFit.cover),
            // 视频播放时长
            Positioned(
              bottom: 6,
              right: 6,
              child: Container(
                padding:
                    EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 3),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  borderRadius: new BorderRadius.circular(40),
                ),
                child: Text(
                  "5:20",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(255, 255, 255, 0.9)),
                ),
              ),
            ),
            // Positioned(
            //   child: _controller.value.initialized
            //       ? AspectRatio(
            //           aspectRatio: _controller.value.aspectRatio,
            //           child: VideoPlayer(_controller),
            //         )
            //       : Container(),
            // ),
            // 视频播放按钮
            Center(
                child: Container(
              width: 60,
              height: 60,
              decoration: new BoxDecoration(
                border: new Border.all(
                    width: 2.0, color: Color.fromRGBO(255, 255, 255, 0.5)),
                color: Color.fromRGBO(0, 0, 0, 0.2),
                borderRadius: new BorderRadius.all(new Radius.circular(60.0)),
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 32,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
