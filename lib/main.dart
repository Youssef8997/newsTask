import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:newsy_test/features/news/data/model/paginated_news_model.dart';
import 'core/utls/Injection_di.dart' as di;
import 'features/news/domain/usaCase/get_news.dart';
import 'features/news/presentation/controller/news_bloc.dart';
import 'features/news/presentation/controller/news_event.dart';
import 'features/news/presentation/screens/news_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => di.sl<NewsBloc>()
          ..add(getNewsEvent(page: "1")),
      child: MaterialApp(
        title: 'News app',
        debugShowCheckedModeBanner: false,
        home: NewsScreen(),
      )
    );
  }
}


