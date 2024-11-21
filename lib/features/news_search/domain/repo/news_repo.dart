import 'dart:developer';

import 'package:base/features/news_search/domain/models/news_model.dart';
import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

import '../../../../network/network_handler.dart';

abstract class NewsRepoInterface {
  Future<List<NewsModel>> requestNews(String searchName);
}

class NewRepoImp implements NewsRepoInterface {
  @override
  Future<List<NewsModel>> requestNews(String searchName) async {
    Response response = await NetworkHandler.instance.get(
      AppEndPoints.newsSearch,
      queryParameters: {
        "q": searchName,
        "apiKey": AppEndPoints.apiKey,
      },
    );
    List<NewsModel> newsList = [];
    for(var item in response.data["articles"]){
      newsList.add(NewsModel.fromJson(item));
    }
    return newsList;
  }
}
