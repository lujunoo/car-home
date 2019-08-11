import 'package:flutter/material.dart';
import 'package:page/components/video.dart';
import 'package:page/components/videoItem.dart';

// 首页——视频
class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: 16,
          itemBuilder: (BuildContext context,int index){
            if(index==0){
              return VideoPageView();
            }
            else{
              return VideoItem();
            }
          },
        ),
    );
  }
}

// pageview 顶部滑动的视频
class VideoPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      height: 160,
      child: PageView(
        controller: PageController(viewportFraction: 0.85),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0, right: 7),
            child: new VideoWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: new VideoWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: new VideoWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: new VideoWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 7),
            child: new VideoWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 7, right: 0),
            child: new VideoWidget(),
          ),
        ],
      ),
    );
  }
}
