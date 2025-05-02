import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsy_test/features/news/presentation/controller/news_bloc.dart';

import 'Injection_di.dart';

extension Bloc on BuildContext {
  NewsBloc get newsBloc {
    return read<NewsBloc>();
  }
}
extension Height on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }
}

extension Width on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }
}