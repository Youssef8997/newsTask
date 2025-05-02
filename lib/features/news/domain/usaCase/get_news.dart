import 'package:fpdart/src/either.dart';
import 'package:newsy_test/features/news/domain/repo/base_news_repo.dart' show BaseNewsRepo;

import '../entities/news.dart';
import '../entities/paginated_news.dart';

class getNewsUseCase{
  final BaseNewsRepo newsRepo;

  getNewsUseCase({required this.newsRepo});
  Future<Either<String, PaginatedNews>>getTopHeadLine(String page)async{
    return await newsRepo.getTopHeadLine(page);
  }
}