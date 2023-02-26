import 'package:flutter/material.dart';
import 'package:news_app/services/dio_helper/dio_helper.dart';
import 'package:news_app/src/app_root.dart';

void main() {
  DioHelper.init();
  runApp(AppRoot());
}

