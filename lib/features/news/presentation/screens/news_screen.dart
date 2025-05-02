import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsy_test/core/utls/extinsion.dart';
import 'package:newsy_test/core/utls/extinsion.dart';
import 'package:newsy_test/core/utls/extinsion.dart';
import 'package:newsy_test/features/news/presentation/controller/news_state.dart';

import '../../../../core/utls/Injection_di.dart';
import '../../../../core/utls/enum/requestState.dart';
import '../controller/news_bloc.dart';
import '../controller/news_event.dart';
import '../widget/news_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ScrollController scrollController=ScrollController();
@override
  void initState() {
  scrollController.addListener((){

  if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {

    if (mounted &&
        sl.get<NewsBloc>().news.length < sl.get<NewsBloc>().totalSize) {
      sl.get<NewsBloc>().add(
        getNewsEvent(page: ( sl.get<NewsBloc>().page + 1).toString()),
      );
    }
  } });
  super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          surfaceTintColor: Colors.white,
centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Articles",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),),

        ),
        body:BlocBuilder<NewsBloc,NewsState>(builder: (context,state){
          return RequestStateBuilder(state: state.requestState,message: state.messages,onLoaded: ()=>ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              controller: scrollController,
              itemBuilder: (context,i)=>NewsWidget(news: state.news[i],), separatorBuilder: (context,_)=>SizedBox(height: 10,), itemCount: state.news.length));
        }

      ));

  }
}
