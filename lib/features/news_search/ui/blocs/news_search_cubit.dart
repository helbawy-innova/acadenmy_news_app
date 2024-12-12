import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/news_search/domain/models/news_model.dart';
import 'package:base/features/news_search/domain/models/news_search_response_model.dart';
import 'package:base/features/news_search/domain/repo/news_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsSearchCubit extends Cubit<AppStates> {
  NewsSearchCubit() : super(LoadingState()) {
    searchNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        paginate();
      }
    });
  }

  //==============================================
  //============================================== Variables
  //==============================================
  NewsRepoInterface newsRepo = NewRepoImp();
  int currentPage = 1;
  int maxPage = 2;
  List<NewsModel> newsList = [];
  TextEditingController searchController = TextEditingController()..text = "bitcoin";
  ScrollController scrollController = ScrollController();

  //==============================================
  //============================================== Functions
  //==============================================
  Future<List<NewsModel>> _requestNewsData(String searchName, int page) async {
    List<NewsModel> newsList = [];
    NewsSearchResponseModel response = await newsRepo.requestNews(searchName, page);
    newsList = response.newsList;
    maxPage = (response.totalResults / 15).ceil();
    return newsList;
  }

  //==============================================
  //============================================== Events
  //==============================================
  void searchNews() async {
    emit(LoadingState());
    try {
      newsList = await _requestNewsData(searchController.text, currentPage);
      if (newsList.isEmpty) {
        emit(EmptyState());
      } else {
        emit(LoadedState(newsList));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
      log(e.toString());
    }
  }

  void paginate() async {
    if (currentPage < maxPage) {
      currentPage++;
      try {
        emit(LoadingState(type:"paginating"));
        newsList += await _requestNewsData(searchController.text, currentPage);
        emit(LoadedState(newsList));
      } catch (e) {
        emit(ErrorState(e.toString()));
        log(e.toString());
      }
    }
  }
}
