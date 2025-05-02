import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../../features/news/data/dataSource/get_news_data_source.dart';
import '../../features/news/data/repo/news_repo.dart';
import '../../features/news/domain/repo/base_news_repo.dart';
import '../../features/news/domain/usaCase/get_news.dart';
import '../../features/news/presentation/controller/news_bloc.dart';
final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<BaseGetNewsDataSource>(() => GetNewsDataSource(dio: sl()));
  sl.registerLazySingleton<BaseNewsRepo>(() => NewsRepo(NewsDataSource: sl()));
  sl.registerLazySingleton(() => getNewsUseCase(newsRepo: sl()));
  sl.registerLazySingleton(() => NewsBloc(sl()));





}