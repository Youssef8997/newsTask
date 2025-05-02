import 'package:newsy_test/features/news/domain/entities/news.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/paginated_news.dart';
import '../../domain/repo/base_news_repo.dart';
import '../dataSource/get_news_data_source.dart';
import 'package:fpdart/fpdart.dart';
class NewsRepo extends BaseNewsRepo{
  final BaseGetNewsDataSource NewsDataSource;

  NewsRepo({required this.NewsDataSource});

  @override
  Future<Either<String,PaginatedNews>> getTopHeadLine(String page)async {
    try{
    final result=await NewsDataSource.getNews(page);

      return right(result);
    } on ServerException catch (e){
      return left(e.errorMessageModel.statusMessage);
    }
  }

}