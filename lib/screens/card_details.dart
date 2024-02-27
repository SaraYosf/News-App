import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../Models/NewsModel.dart';

class CardDetails extends StatelessWidget {
   static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;

    return  Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 35,),
              Text(article.title??'',style: const TextStyle(fontSize:20 ,fontWeight: FontWeight.bold)),
              const SizedBox(height: 25,),
              CachedNetworkImage(
                imageUrl:article.urlToImage ??'',height: 150,fit:BoxFit.cover ,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

              const SizedBox(height: 5,),
              Text(article.title??'',style: const TextStyle(fontSize:16 ,fontWeight: FontWeight.bold)),
              const SizedBox(height: 5,),
              Text(article.description??'',),
              const SizedBox(height: 5,),
              Container(child: Text(article.content??'')),
              const SizedBox(height: 5,),
              Text(
                "author ${article.author ?? ''}",style: TextStyle(fontSize:12,color: Colors.grey),),
              const SizedBox(height: 5,),
              Text("publishedAt ${article.publishedAt??''}",style: TextStyle(fontSize:12,color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
