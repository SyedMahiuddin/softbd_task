import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softbd_task/consts/colors.dart';

import '../Commons/custom_widgets.dart';
import '../consts/space_helper.dart';

class AddNewPage extends StatelessWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: _buildTopView(context),
            ),
          ),
          Positioned(
            top: 100.h,left: 1,right: 1,
              child: _buildForm()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CustomView().customButton(textData: "সংরক্ষন করুন", fontSize: 18,
                  onPressed: (){
                    Get.back();
                    showCustomAlertDialog(context);
                  }, borderRadius: 12, height: 46, width: 327, elevation: 0),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopView(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceHelper.verticalSpace20,
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                    child: Icon(Icons.arrow_back,size: 30.sp,)),
                CustomView().printHeader(fontSize: 16, textData: "নতুন যোগ করুন"),
               SpaceHelper.horizontalSpace25
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForm(){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SizedBox(
        width: 327.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomView().printMediumText(fontSize: 16, textData: "অনুচ্ছেদ"),
                CustomView().printLightText(fontSize: 14, textData: "৪৫ শব্দ"),

              ],
            ),
            SpaceHelper.verticalSpace10,
            Container(
              height: 35.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: ColorHelper.backWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1,color: ColorHelper.lightBlack)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomView().printLightText(fontSize: 14, textData: "অনুচ্ছেদ লিখুন"),
              ),
            ),
            CustomView().printMediumText(fontSize: 16, textData: "অনুচ্ছেদের বিভাগ"),
            SpaceHelper.verticalSpace10,
            Container(
              height: 35.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: ColorHelper.backWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1,color: ColorHelper.lightBlack)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomView().printLightText(fontSize: 14, textData: "অনুচ্ছেদের বিভাগ নির্বাচন করুন"),
                    Icon(Icons.arrow_forward_ios,color: ColorHelper.lightBlack,size: 12.sp,)
                  ],
                ),
              ),
            ),
            SpaceHelper.verticalSpace10,
            CustomView().printMediumText(fontSize: 16, textData: "তারিখ ও সময়"),
            SpaceHelper.verticalSpace10,
            Container(
              height: 35.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: ColorHelper.backWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1,color: ColorHelper.lightBlack)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month,color: ColorHelper.lightBlack,size: 15.sp,),
                        SpaceHelper.horizontalSpace5,
                        CustomView().printLightText(fontSize: 14, textData: "নির্বাচন করুন"),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,color: ColorHelper.lightBlack,size: 12.sp,)
                  ],
                ),
              ),
            ),
            SpaceHelper.verticalSpace10,
            CustomView().printMediumText(fontSize: 16, textData: "স্থান"),
            SpaceHelper.verticalSpace10,
            Container(
              height: 35.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: ColorHelper.backWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1,color: ColorHelper.lightBlack)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: ColorHelper.lightBlack,size: 15.sp,),
                        SpaceHelper.horizontalSpace5,
                        CustomView().printLightText(fontSize: 14, textData: "নির্বাচন করুন"),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,color: ColorHelper.lightBlack,size: 12.sp,)
                  ],
                ),
              ),
            ),
            SpaceHelper.verticalSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomView().printMediumText(fontSize: 16, textData: "অনুচ্ছেদের বিবরণ"),
                CustomView().printLightText(fontSize: 14, textData: "১২০ শব্দ"),
              ],
            ),
            SpaceHelper.verticalSpace10,
            Container(
              height: 35.h,
              width: 327.w,
              decoration: BoxDecoration(
                  color: ColorHelper.backWhite.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1,color: ColorHelper.lightBlack)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomView().printLightText(fontSize: 14, textData: "কার্যক্রমের বিবরণ লিখুন"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(14.sp)
           ),
            height: 286.h,
            width: 327.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                 CustomView().printImage(height: 76, width: 84, path: "assets/icons/iconImages/done.png"),
                  SpaceHelper.verticalSpace25,
                  CustomView().printHeader(fontSize: 16, textData: "নতুন অনুচ্ছেদ সংরক্ষন"),
                  SpaceHelper.verticalSpace10,
                  CustomView().printLightText(fontSize: 14, textData: "আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে "),
                  SpaceHelper.verticalSpace15,
                  CustomView().customButton(
                      textData: "আরও যোগ করুন",
                      fontSize: 18,
                      onPressed: (){
                        Get.back();
                        Get.to(const AddNewPage());
                      },
                      borderRadius: 12, height: 46, width: 207, elevation: 0.2)
                ],
              ),
            ),
          ),
        );
      },
    );}
}
