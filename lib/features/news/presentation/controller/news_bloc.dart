import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:newsy_test/features/news/domain/entities/news.dart';

import '../../../../core/utls/enum/requestState.dart';
import '../../domain/usaCase/get_news.dart';
import 'news_event.dart';
import 'news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<newsEvent, NewsState> {
  final getNewsUseCase newsUseCase;
int totalSize=0;
int page=1;
List<News> news=[];
  NewsBloc(this.newsUseCase) :super(NewsState()) {
    on<getNewsEvent>(_getNews);
  }

  FutureOr<void> _getNews(getNewsEvent event, Emitter<NewsState> emit) async {
    final result = await newsUseCase.getTopHeadLine(event.page);

    result.fold((l) => emit(state.copyWith(messages: l,requestState:RequestState.error )), (r)  {
      log(r.news.length.toString());
      totalSize=r.totalResults;
      if (event.page != "1") {
        news.addAll(r.news);
      page += 1;
        emit(NewsState(news: news, requestState: RequestState.loaded,));
        return;
      }
      news = r.news;
      page = 1;
      emit(state.copyWith(requestState: RequestState.loaded, news: r.news));
    });
        }
}