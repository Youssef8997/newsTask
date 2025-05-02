import 'package:newsy_test/features/news/domain/entities/news.dart';

class newsModel extends News {
  newsModel({
    required super.title,
    required super.description,
    required super.author,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });
  factory newsModel.fromJson(Map<String,dynamic>json)=>newsModel(
    title: json["title"],
    content: json["content"],
    author: json["author"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],

  );
}
