import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_app/screens/business_screen.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/services/dio_helper/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];
  List<String>title=[
    'Business',
    'Sports',
    'Science',
    'Settings'
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(index==1)
      getSports();
    else if(index==2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];

  getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category":"business",
      "apiKey":"18e9d4c4f7454c24b98c496bbce0c9ec"
    }).then((value) {
      business=value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print('im here');
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category":"sports",
      "apiKey":"18e9d4c4f7454c24b98c496bbce0c9ec"
    }).then((value) {
      sports=value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){

      emit(NewsGetSportsErrorState(error.toString()));
    });
  }


  List<dynamic> science = [];

  getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: "v2/top-headlines", query: {
      "country": "eg",
      "category":"science",
      "apiKey":"18e9d4c4f7454c24b98c496bbce0c9ec"
    }).then((value) {
      science=value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(url: "v2/everything", query: {
      "q":value,
      "apiKey":"18e9d4c4f7454c24b98c496bbce0c9ec"
    }).then((value) {
      search=value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isDark=false;
  changeMode(){
    isDark=!isDark;
    emit(NewsAppChangeModeState());
  }
}
