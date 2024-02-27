import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapp/screens/home_cubit/state.dart';

import '../../Models/NewsModel.dart';
import '../../Models/cat_model.dart';
import '../../Models/sources_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Sources> sources = [];
  List<Articles> articles = [];
  CategoryModel? categoryModel;
  int ind = 0;

  getSelectedCategory(category) {
    emit(InitHomeState());
    categoryModel = category;
    emit(ChangeCategoryHomeState());
  }

  changeSource(int value) {
    emit(InitHomeState());
    ind = value;
    emit(ChangeSourceHomeState());
  }

  Future<void> getSources() async {
    try {
      emit(LoadingSourceHomeState());
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources", {
        "apiKey": "8af38e4ccd7f4145b5b4a5613822749c",
        "category": categoryModel?.id
      });
      Response response = await http.get(url);
      var jasonData = jsonDecode(response.body);
      SourcesModel data = SourcesModel.fromJson(jasonData);
      sources = data.sources ?? [];
      emit(SuccessSourceHomeState());
    } catch (e) {
      emit(ErrorSourceHomeState());
      throw Exception();
    }
  }

  Future<void> getNews() async {
    try {
      emit(LoadingGetNewsHomeState());
      Uri url = Uri.parse(
          'https://newsapi.org/v2/everything?apiKey=8af38e4ccd7f4145b5b4a5613822749c&sources=${sources[ind].id}');
      Response responseNews = await http.get(url);
      var jasonData = jsonDecode(responseNews.body);
      NewsModel newsResponse = NewsModel.fromJson(jasonData);
      articles = newsResponse.articles ?? [];
      emit(SuccessGetNewsHomeState());
    } catch (e) {
      emit(ErrorGetNewsHomeState());
      throw Exception();
    }
  }
}
