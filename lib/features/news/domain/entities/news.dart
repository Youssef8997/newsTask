import 'package:equatable/equatable.dart';

class News extends Equatable {
final String title;
final String? description;
final String author;
final String url;
final String? urlToImage;
final String publishedAt;
final String? content;

  const News({required this.title, required this.description, required this.author, required this.url, required this.urlToImage, required this.publishedAt, required this.content});

  @override
  List<Object?> get props => [
    title,
    description,
    author,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}