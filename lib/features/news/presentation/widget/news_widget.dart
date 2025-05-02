import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsy_test/core/utls/extinsion.dart';
import 'package:newsy_test/features/news/domain/entities/news.dart';

import '../screens/web_view_screen.dart';


class NewsWidget extends StatelessWidget {
  final News news;

  const NewsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => WebViewScreen(url: news.url),
        )
        );
      },
      child: Container(
        height: context.height*.15,
        width: context.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            ),
          ],
        ),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 5).copyWith(start: 0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: news.urlToImage ?? "",
              imageBuilder:
                  (context, i) => Container(
                    height: context.height*.15,
                    width: context.width*.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12),
                      image: DecorationImage(image: i, fit: BoxFit.fill),
                    ),
                  ),
              placeholder: (context,_)=>Container(
                height: context.height*.15,
                width: context.width*.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),

                  image: DecorationImage(image: AssetImage("assets/logo.png"), fit: BoxFit.fill),
                ),
              ),
              errorWidget:(context,_,a)=>Container(
                height: context.height*.15,
                width: context.width*.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(12),

                  image: DecorationImage(image: AssetImage("assets/logo.png"), fit: BoxFit.fill),
                ),
              ) ,
            ),
            SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width*.6,
                  child: Text(
                    news.title,
                    maxLines: 2,

                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if( news.description!=null)
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      SizedBox(
                        width: context.width*.6,
                        child: Text(

                          news.description??"",
                          maxLines: 2,

                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),


                    ],
                  ),
                SizedBox(height: 10,),
                SizedBox(
                  width: context.width*.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.width*.1,

                        child: Text(
                          news.author,
                          maxLines: 1,

                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Text(
                        news.publishedAt,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w400,

                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
