import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/blocs/news/news_cubit.dart';
import 'package:news_app/components/build_article_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // NewsCubit.get(context).getBusiness();
    return BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=NewsCubit.get(context);
          return state is NewsGetBusinessLoadingState?  Center(child: CircularProgressIndicator(
            color: Colors.deepOrange,
          )): ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildArticleItem(article:cubit.business[index] ,),
              separatorBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
              itemCount: cubit.business.length);
        });
  }
}
