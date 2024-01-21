import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
   TabWidget(this.name,this.isSelected, {super.key});
String name;
bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      border: Border.all(color: Colors.green,width: 2),
        borderRadius: BorderRadius.circular(12),color:isSelected? Colors.green:Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
        margin: const EdgeInsets.only(top: 6),
        child: Text(name,style: TextStyle(color: isSelected?Colors.white:Colors.green),));

  }
}
