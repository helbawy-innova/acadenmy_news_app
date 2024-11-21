import 'dart:developer';

import 'package:base/configurations/app_states.dart';
import 'package:base/features/news_search/domain/models/news_model.dart';
import 'package:base/features/news_search/domain/repo/news_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsSearchCubit extends Cubit<AppStates>{
  NewsSearchCubit() : super(LoadingState()){
    searchNews("Techs");
  }
  //==============================================
  //============================================== Variables
  //==============================================
  NewsRepoInterface newsRepo = NewRepoImp();
  //==============================================
  //============================================== Functions
  //==============================================
  Future<List<NewsModel>> _requestNewsData(String searchName) async{
    List<NewsModel> newsList = [];
    newsList = await newsRepo.requestNews(searchName);
    return newsList;
  }
  //==============================================
  //============================================== Events
  //==============================================
  void searchNews(String searchName) async{
    emit(LoadingState());
    try{
      List<NewsModel> newsList = await _requestNewsData(searchName);
      if(newsList.isEmpty){
        emit(EmptyState());
      }else{
        log("Successs");
        emit(LoadedState(newsList));
      }
    }catch(e){
      emit(ErrorState(e.toString()));
      log(e.toString());
    }
  }
}