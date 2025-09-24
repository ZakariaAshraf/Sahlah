import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheapestTodayWidget extends StatelessWidget {
  const CheapestTodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 200.h,
        width: 400.w,
        decoration: BoxDecoration(
          border: Border.all(strokeAlign: 0.5),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Image(image: AssetImage("assets/images/soon.jpg"),fit: BoxFit.fill,),
      ),
    );
  }
}
