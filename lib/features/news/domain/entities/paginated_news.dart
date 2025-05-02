import 'package:equatable/equatable.dart';

import 'news.dart';

class PaginatedNews extends Equatable{
  final int totalResults;
  final List<News> news;

  const PaginatedNews({required this.totalResults, required this.news});
  @override
  // TODO: implement props
  List<Object?> get props => [news,totalResults];
}