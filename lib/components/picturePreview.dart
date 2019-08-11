import 'package:flutter/material.dart';

// 图片预览组件
class PicturePreview extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PicturePreview();
  }
}

class _PicturePreview extends State<PicturePreview> {
  var indexItem=1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(70, 70, 70, 1),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromRGBO(70, 70, 70, 1),
          title: Text(
            "图片预览",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.arrow_downward,
                  size: 30,
                ),
                onPressed: () {})
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[

              Container(
                child: new PageView(
                  onPageChanged:(val){
                    if(val==0){
                      setState(() {
                        indexItem =1;
                      });
                    }
                    else{
                      setState(() {
                        indexItem =val+1;
                      });
                    }

                  },
                  controller: PageController(viewportFraction: 1),
                  children: <Widget>[
                    Image.network(
                      "http://imagecn.gasgoo.com/moblogo/News/UEditor/image/20180809/6366942820085998194660746.jpg",
                      fit: BoxFit.contain,
                    ),
                    Image.network(
                      "http://img3.bitautoimg.com/autoalbum/files/20140903/372/15253137244914_3589582_14.jpg",
                      fit: BoxFit.contain,
                    ),
                    Image.network(
                      "https://sjbz-fd.zol-img.com.cn/t_s320x510c/g5/M00/0F/0F/ChMkJ1fJSueIPHu9AAFdqcK45ZEAAU88AHsyF4AAV3B667.jpg",
                      fit: BoxFit.contain,
                    ),
                    Image.network(
                      "http://imagecn.gasgoo.com/moblogo/News/UEditor/image/20180809/6366942820085998194660746.jpg",
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$indexItem/23",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.infinity,
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
