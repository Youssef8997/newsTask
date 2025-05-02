import 'package:equatable/equatable.dart';

import '../../../../core/utls/enum/requestState.dart';
import '../../domain/entities/news.dart';

 class NewsState {
 List<News>news;
final String messages;
final RequestState requestState;
 NewsState( {
   this.news=const [], this.messages="", this.requestState=RequestState.loading,
 });
  NewsState copyWith({
 List<News>?news,
 String ?messages,
 RequestState? requestState,}){
    return NewsState(
      news: news??this.news,
      messages: messages??this.messages,
      requestState: requestState??this.requestState
    );
  }

}
