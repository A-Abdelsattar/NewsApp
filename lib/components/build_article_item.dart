import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BuildArticleItem extends StatelessWidget {
  var article;


  BuildArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 150.w,
            height: 130.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(article['urlToImage'] == null
                        ? 'https://img.freepik.com/free-vector/gradient-no-photo-sign-design_23-2149288316.jpg'
                        : "${article['urlToImage']}"),
                    fit: BoxFit.cover)
                  ),
            // child: CachedNetworkImage(
            //   imageUrl: (article['urlToImage'] == null
            //       ? 'https://img.freepik.com/free-vector/gradient-no-photo-sign-design_23-2149288316.jpg'
            //       : "${article['urlToImage']}"),
            //   progressIndicatorBuilder: (context, url, downloadProgress) =>
            //       CircularProgressIndicator(value: downloadProgress.progress),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Container(
              height: 130.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article["title"]}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
