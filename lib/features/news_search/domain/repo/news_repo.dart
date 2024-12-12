import 'dart:developer';

import 'package:base/features/news_search/domain/models/news_model.dart';
import 'package:base/network/app_end_points.dart';
import 'package:dio/dio.dart';

import '../../../../network/network_handler.dart';
import '../models/news_search_response_model.dart';

abstract class NewsRepoInterface {
  Future<NewsSearchResponseModel> requestNews(String searchName,int page);
}

class NewRepoImp implements NewsRepoInterface {
  @override
  Future<NewsSearchResponseModel> requestNews(String searchName,int page) async {
    Response response = await NetworkHandler.instance.get(
      AppEndPoints.newsSearch,
      queryParameters: {
        "q": searchName,
        "apiKey": AppEndPoints.apiKey,
        "page": page,
        "pageSize": 15,
      },
    );
    List<NewsModel> newsList = [];
    for(var item in response.data["articles"]){
      newsList.add(NewsModel.fromJson(item));
    }
    return NewsSearchResponseModel(newsList: newsList, totalResults: response.data["totalResults"]);
  }
}
