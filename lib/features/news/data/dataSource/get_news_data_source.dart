import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsy_test/core/error/error_message_model.dart';
import 'package:newsy_test/features/news/data/model/news_model.dart' show newsModel;
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../../../../core/utls/constant.dart';
import '../../../../core/error/exceptions.dart';
import '../model/paginated_news_model.dart';

abstract class BaseGetNewsDataSource{
Future <PaginatedNewsModel>getNews(String page);
}
class GetNewsDataSource extends BaseGetNewsDataSource{
  final Dio dio;
  GetNewsDataSource({required this.dio});
  @override
  Future<PaginatedNewsModel> getNews(String page) async {
    if( await SimpleConnectionChecker.isConnectedToInternet()){
      Response response=await dio.get("${constant.baseUrl}/top-headlines?country=us&apiKey=${constant.apiKey}&pageSize=20&page=${page}");
      if(response.statusCode==200){
        return PaginatedNewsModel.fromJson(response.data);
      }else{
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel(statusCode: "404", statusMessage: "no internet Connection", code: "no internet Connection"));

    }

  }
}