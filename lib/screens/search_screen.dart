import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news/news_cubit.dart';
import 'package:news_app/components/build_article_item.dart';


class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsState>(listener: (context,state){}, builder: (context,state){
      var list=NewsCubit.get(context).search;
      var cubit=NewsCubit.get(context);
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller:searchController ,
                style: TextStyle(
                  color: cubit.isDark? Colors.white:Colors.black
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cubit.isDark?Colors.white:Colors.black)
                  ),
                  labelStyle: TextStyle(
                    color: cubit.isDark?Colors.white:Colors.black
                  ),
                  border: OutlineInputBorder(),
                  label: Text('search'),
                  prefixIcon: Icon(Icons.search,color: cubit.isDark?Colors.white:Colors.black,),
                ),
                onChanged:(value){
                  NewsCubit.get(context).getSearch(value);
                } ,
              ),
            ),
             Expanded(child: ListView.separated(itemBuilder: (context,index)=>BuildArticleItem(article: list[index]), separatorBuilder: (context,index)=>Divider(), itemCount: cubit.search.length))
          ],
        ),
      );
    });
  }
}
