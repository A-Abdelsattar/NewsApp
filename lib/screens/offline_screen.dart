import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Text('Check your Internet Connection!',style: TextStyle(
            color: Colors.red,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
          ),),
           SizedBox(
             height: 30.h,
           ),
          Icon(Icons.warning,color: Colors.red,size: 100,),
          Container(
            width: double.infinity,
            height: 350.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/offline.jpg')
              )
            ),
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
