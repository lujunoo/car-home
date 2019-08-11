import 'package:flutter/material.dart';
import 'package:page/components/article.dart';
// 首页——易车号
class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body:ListView.builder(
        itemCount: 30,
        itemBuilder:(BuildContext context ,int index){
          return ArticleItem();
        },
      ),
    );
      
  }
}