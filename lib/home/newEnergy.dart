import 'package:flutter/material.dart';
import 'package:page/components/article.dart';
import 'package:page/components/pictureCollection.dart';
// 首页——新能源
class NewEnergy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (BuildContext context,int index){
          if(index%3==0){
            return PictureCollection();
          }
          else{
            return  ArticleItem();
          }
        },
      )
    );
      
  }
}