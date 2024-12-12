import 'package:base/features/news_search/domain/models/news_model.dart';

class NewsSearchResponseModel {
  List<NewsModel> newsList;
  int totalResults;
  NewsSearchResponseModel({
    required this.newsList,
    required this.totalResults,
  });
}