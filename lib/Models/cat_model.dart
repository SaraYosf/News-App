import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String name;
  String img;
  Color color;

  CategoryModel(this.id,this.name,this.img,this.color);
  
 static List<CategoryModel> getCategory(){
    return
        [CategoryModel('business', 'business', 'assets/arrows.jpg', Colors.red),
        CategoryModel('entertainment', 'entertainment', 'assets/environment.jpg', Colors.blueGrey),
        CategoryModel('health', 'health',  'assets/heart.jpg', Colors.pinkAccent),
        CategoryModel('sports', 'sports',  'assets/ball.jpg', Colors.red),
        CategoryModel('technology', 'technology',  'assets/hummer.jpg', Colors.green),
        CategoryModel('science', 'science',  'assets/science.jpg', Colors.blueGrey)];
  }
}