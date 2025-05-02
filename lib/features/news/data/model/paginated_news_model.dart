import '../../domain/entities/paginated_news.dart';
import 'news_model.dart';

class PaginatedNewsModel extends PaginatedNews {
  const PaginatedNewsModel({required super.totalResults, required super.news});

  factory PaginatedNewsModel.fromJson(Map<String, dynamic> json) =>
      PaginatedNewsModel(
        totalResults: json["totalResults"],
        news: List.generate(
          json["articles"].length,
          (i) => newsModel.fromJson(json["articles"][i]),
        ),
      );
}
