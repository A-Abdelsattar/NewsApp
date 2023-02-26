import 'package:flutter/material.dart';

class AppNavigator {

  static navigateToNewScreen(context, screen, isFinished) {
    isFinished == true
        ? Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    )
        : Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}