import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/news/news_cubit.dart';
import '../components/build_article_item.dart';


class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return cubit.sports.length<=0?  Center(child: CircularProgressIndicator(
            color: Colors.deepOrange,
          )): ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildArticleItem(article:cubit.sports[index] ,),
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                child: Divider(thickness: 2),
              ),
              itemCount: cubit.sports.length);
        });
  }
}
