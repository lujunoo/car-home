import 'package:flutter/material.dart';
import 'package:page/components/videoPaly.dart';

// 首页——短视频
class ShortVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(bottom: 100),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //横轴三个子widget
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          childAspectRatio: 0.7 //宽高比为1时，子widget
          ),
      scrollDirection: Axis.vertical,
      itemCount: 22,
      cacheExtent: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
          alignment: Alignment(10, 20),
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  'http://img3.bitautoimg.com/autoalbum/files/20140903/372/15253137244914_3589582_14.jpg',
                ),
                fit: BoxFit.cover),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return VideoPaly();
              }));
            },
            child: new Stack(
              children: <Widget>[
              new  Positioned(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题小视频标题",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "23423播放",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "123赞",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
