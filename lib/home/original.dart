import 'package:flutter/material.dart';
import 'package:page/components/pictureCollection.dart';
// 首页——原创
class Original extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body:ListView.builder(
        itemCount: 60,
        itemBuilder: (BuildContext context,int index){
          return PictureCollection();
        },
      )
    );
      
  }
}