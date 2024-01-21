import 'package:flutter/material.dart';
import 'package:newsapp/Models/cat_model.dart';
import 'package:newsapp/screens/widgets/cat_widget.dart';
class CategoryScreen extends StatefulWidget {
  CategoryScreen(this.getCategory, {super.key});
  Function getCategory;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryModel> categories = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){
                    widget.getCategory(categories[index]);
                        },
                  child: CategoryWidget(categories[index], index));
            },
            itemCount: categories.length,
          ),
        )
      ],
    );
  }
}