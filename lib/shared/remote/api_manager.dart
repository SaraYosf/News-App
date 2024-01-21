import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/Models/sources_model.dart';

import '../../Models/NewsModel.dart';

class ApiManager {
 static Future<SourcesModel> getSources( category) async{
    Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources",
        {"apiKey":"8af38e4ccd7f4145b5b4a5613822749c",
        "category" : category
        });
    Response response=await http.get(url);
    var jasonData=jsonDecode(response.body);
    SourcesModel data=SourcesModel.fromJson(jasonData);
    return data;
  }

  static Future<NewsModel> getNews(String source) async{
   Uri url=Uri.parse('https://newsapi.org/v2/everything?apiKey=8af38e4ccd7f4145b5b4a5613822749c&sources=$source');
   Response responseNews= await http.get(url);
   var jasonData=jsonDecode(responseNews.body);
NewsModel dataNews=NewsModel.fromJson(jasonData);
return dataNews;
  }
}