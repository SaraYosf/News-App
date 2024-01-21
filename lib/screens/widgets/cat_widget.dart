import 'package:flutter/material.dart';
import 'package:newsapp/Models/cat_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget(this.category,this.index, {super.key});

  CategoryModel category;
int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration:
      BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
              bottomRight: index.isEven? const Radius.circular(18):const Radius.circular(0),
              bottomLeft: index.isOdd? const Radius.circular(18):const Radius.circular(0),
              topLeft: const Radius.circular(18),
              topRight: const Radius.circular(18),
          )),

      child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            category.img,
            height: 100,
          ),
          Text(category.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ],
      ),
    );
  }
}
