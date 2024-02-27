import 'package:flutter/material.dart';
import 'package:newsapp/screens/home_cubit/cubit.dart';
import 'package:newsapp/screens/home_cubit/state.dart';
import 'package:newsapp/screens/tab_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Models/cat_model.dart';
import '../screens/cat_screen.dart';

class HomeLayout extends StatelessWidget {
   HomeLayout({super.key});

  static const String routeName = "home";

  List<CategoryModel> catDrawer = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getSources(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is LoadingGetNewsHomeState|| state is LoadingSourceHomeState){
            showDialog(context: context, builder: (context) =>
              const AlertDialog(
                title: Center(child: CircularProgressIndicator()),
              )
            ,);
          }else if(state is SuccessSourceHomeState){
            HomeCubit.get(context).getNews();
          }else if(state is ErrorSourceHomeState){

          }else if(state is ChangeSourceHomeState){
            HomeCubit.get(context).getNews();

          }else if(state is SuccessGetNewsHomeState){
            Navigator.pop(context);
          }else if(state is ErrorGetNewsHomeState){

          }

        }, builder: (context, state) {
        return Scaffold(
          drawer: HomeCubit.get(context).categoryModel?.name != null ?
          Drawer(
            child: ListView.builder(itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    HomeCubit.get(context).getSelectedCategory(catDrawer[index]);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container
                          (height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40))
                          ,
                          child: Image.asset(
                              catDrawer[index].img, fit: BoxFit.cover),
                        ), const SizedBox(width: 7),
                        Text(catDrawer[index].name,
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ));
            }, itemCount: catDrawer.length),) : Container(),
          appBar: AppBar(
              centerTitle: true,
              title: Text(HomeCubit.get(context).categoryModel?.name ?? "News App"),
              elevation: 0,
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)))),
          body: HomeCubit.get(context).categoryModel == null
              ? CategoryScreen(HomeCubit.get(context).getSelectedCategory)
              : TabScreen(),
        );},

      ),
    );
  }



}
