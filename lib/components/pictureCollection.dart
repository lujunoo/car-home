import 'package:flutter/material.dart';
import 'package:page/components/picturePreview.dart';

// 图片集合Item
class PictureCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PictureCollection();
  }
}

class _PictureCollection extends State<PictureCollection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context){
          return new PicturePreview();
        }));
      },
      child: new Container(
        margin: EdgeInsets.only(top: 15, right: 15, left: 15,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "这是图片集合这是图片集合这是图片集合",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(35, 35, 35, 1),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "这是图片集合这是图片集合这是图片集合这是图片集合这是图片集合这是图片集合",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(117, 117, 117, 1),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child:ClipRRect(
                        borderRadius:BorderRadius.horizontal(left: Radius.circular(10),) ,
                        child:Padding(
                        padding: EdgeInsets.only(right: 1),
                          child: Image(
                            image: NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553444376434&di=a7081fac2d6e052647bcba000435875a&imgtype=0&src=http%3A%2F%2F01.imgmini.eastday.com%2Fmobile%2F20171121%2F20171121062624_efdf474ba14fd333040f438b6a39dc1e_3.jpeg"),
                            fit: BoxFit.cover,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 1),
                        child: Image(
                          image: NetworkImage(
                              "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2645762548,1792995004&fm=26&gp=0.jpg"),
                          fit: BoxFit.cover,
                          height: 80,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:ClipRRect(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                        child:Image(
                          image: NetworkImage(
                              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553444476312&di=971f084147ecee9be0b8e4a2c266ad55&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn%2F20170917%2F7c29-fykywuc5519247.jpg"),
                          fit: BoxFit.cover,
                          height: 80,
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: EdgeInsets.only(top: 2,left: 10,right: 10,bottom: 3),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.4),
                      borderRadius: new BorderRadius.circular(40),
                    ),
                    child: Text("99图",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 255, 255, 0.9)
                      ),
                    ),
                  ) ,
                )
               
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text(
                    "卢大爷666",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(73, 73, 73, 1),
                    ),
                  ),
                   Text(
                    "234评论",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(73, 73, 73, 1),
                    ),
                  ),
                ],
              ),
              
            ),
            Divider(
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
