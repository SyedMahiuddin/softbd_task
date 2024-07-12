import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/space_helper.dart';

class CustomView{
Widget printImage({required int height, required int width, required String path}){
  return  SizedBox(
      height: height.h,width: width.w,
      child: Image.asset(height: height.h,width: width.w,path));
}

Widget printHeader({required int fontSize, required String textData}){
  return Text(textData,style: TextStyle(fontWeight: FontWeight.bold,fontSize: fontSize.sp),);
}

Widget printlightText({required int fontSize, required String textData}){
  return Text(textData,style: TextStyle(fontWeight: FontWeight.normal,fontSize: fontSize.sp),);
}

Widget printMediumText({required int fontSize, required String textData}){
  return Text(textData,style: TextStyle(fontWeight: FontWeight.w600,fontSize: fontSize.sp),);
}

// ignore: non_constant_identifier_names
Widget printCategory({required var Item}){
  return SizedBox(
    height: 125.h, // Adjust height as needed
    width: 80.w,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 73.h,
          width: 75.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:const Color(0xFFF1EFEF),
          ),
          child: Center(
            child: CustomView().printImage(
              height: 32,
              width: 25,
              path: Item["iconImage"],
            ),
          ),
        ),
        SpaceHelper.verticalSpace5,
        CustomView().printHeader(
          fontSize: 15,
          textData: Item["name"],
        ),
        CustomView().printHeader(
          fontSize: 15,
          textData: Item["serial"],
        ),
      ],
    ),
  );
}

Widget singleTextContainer(
    {required Color color, required String textData, required int height, required int width}){
  return  Container(
    height: height.h,width: width.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color,width: 1)
    ),
    child: Center(child: CustomView().printMediumText(fontSize: 12, textData: textData),),
  );
}

}