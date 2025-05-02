import 'package:fpdart/fpdart.dart';

import '../entities/paginated_news.dart';

abstract class BaseNewsRepo{
  Future<Either<String,PaginatedNews>>getTopHeadLine(String page);
}
