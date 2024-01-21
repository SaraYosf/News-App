import 'package:flutter/material.dart';
import 'package:newsapp/screens/tab_screen.dart';

import '../Models/cat_model.dart';
import '../screens/cat_screen.dart';
import '../shared/remote/api_manager.dart';

class HomeLayout extends StatefulWidget {
   const HomeLayout({super.key});

  static const String routeName = "home";
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout> {
  List<CategoryModel> catDrawer=CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     drawer: Drawer(
        child: ListView.builder(itemBuilder:  (context, index) {
          return InkWell(
            onTap: (){
              getSelectedCategory(catDrawer[index]);
              Navigator.pop(context);
            },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container
                      (height: 75,
                      width: 50,
                      child: Image.asset(catDrawer[index].img),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40))
                      ,
                    ),
                    Text(catDrawer[index].name),
                  ],
                ),
              ));
        }, itemCount: catDrawer.length),),
      appBar: AppBar(
        centerTitle: true,
          title:  Text(categoryModel?.name?? "News App"),
          elevation: 0,
          backgroundColor: Colors.green,
          shape:  const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18)))),
      body: FutureBuilder(
        future: ApiManager.getSources(categoryModel?.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Text("some thing wrong");
          }
          var sources = snapshot.data?.sources ?? [];
          return categoryModel==null? CategoryScreen(getSelectedCategory):TabScreen(sources: sources);
        },
      ),
    );
  }
  CategoryModel? categoryModel;
  getSelectedCategory(category) {
    categoryModel = category;
    setState(() { });
  }
}
