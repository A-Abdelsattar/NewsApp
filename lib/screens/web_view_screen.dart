import 'package:flutter/material.dart';


class WebViewScreen extends StatelessWidget {
   WebViewScreen({Key? key, this.article}) : super(key: key);
var  article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Image.network("https://img.freepik.com/free-vector/gradient-no-photo-sign-design_23-2149288316.jpg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article["title"]),
          )

        ],
      )
    );
  }
}
