
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softbd_task/Commons/custom_widgets.dart';
import 'package:softbd_task/consts/colors.dart';
import 'package:softbd_task/consts/space_helper.dart';

import '../Controller/view_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final ViewController viewController=Get.put(ViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backWhite,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _buildTopView(),
          ),
          Positioned(
            top: 80.h,
              left: 0,
              child: Column(
            children: [
              _buildIdView(),
              SpaceHelper.verticalSpace10,
              _buildTimeView(),
              SpaceHelper.verticalSpace10,
              _buildCategoryView()

            ],
          )),

        ],
      ),
    );
  }

  Widget _buildTopView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceHelper.verticalSpace20,
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu,size: 30.sp,),
                    CustomView().printImage(height: 40, width: 40, path: "assets/icons/iconImages/demo.png"),
                    CustomView().printHeader(fontSize: 18, textData: "Flutter Task"),
                  ],
                ),
              ),
              CustomView().printImage(height: 32, width: 32, path: "assets/icons/iconImages/notification.png"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIdView(){
    return Padding(
      padding:  EdgeInsets.all(12.sp),
      child: Container(
        height: 98.h,width: 327.w,
        decoration: BoxDecoration(
          color: ColorHelper.frontWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset:const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            SpaceHelper.horizontalSpace10,
            CircleAvatar(
              backgroundColor: ColorHelper.frontWhite,
              radius: 40.sp,
              backgroundImage:const AssetImage("assets/images/person.png"),
            ),
            SpaceHelper.horizontalSpace10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomView().printHeader(fontSize: 20, textData: "মোঃ মোহাইমেনুল রেজা"),
                CustomView().printLightText(fontSize: 14, textData: "সফটবিডি লিমিটেড"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomView().printImage(height: 16, width: 16, path: "assets/images/mapPoint.png"),
                    SpaceHelper.horizontalSpace5,
                    CustomView().printLightText(fontSize: 14, textData: "ঢাকা"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryView(){
    return SizedBox(
      height: 260.h,
      width: 290.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomView().printCategory(Item: viewController.categories[0]),
              CustomView().printCategory(Item: viewController.categories[1]),
              CustomView().printCategory(Item: viewController.categories[2]),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomView().printCategory(Item: viewController.categories[3]),
              CustomView().printCategory(Item: viewController.categories[4]),
              CustomView().printCategory(Item: viewController.categories[5]),

            ],
          )
        ],
      ),
    );
  }

  Widget _buildTimeView(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 100.w, // Adjust the size of the progress indicator
                  height: 100.w,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.square,
                    strokeWidth: 10.sp,
                    value: 0.2,
                    valueColor:const AlwaysStoppedAnimation<Color>(ColorHelper.darkGreen,),
                    backgroundColor:const Color(0xFFF1EFEF),
                  ),
                ),
                CustomView().printMediumText(fontSize: 16, textData: "৬ মাস ৬ দিন "),
              ],
            ),
            SpaceHelper.verticalSpace10,
            CustomView().printHeader(fontSize: 16, textData: "সময় অতিবাহিত")
          ],
        ),
        SpaceHelper.horizontalSpace15,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomView().printHeader(fontSize: 16, textData: "মেয়াদকাল"),
            Row(
              children: [
                CustomView().printImage(height: 14, width: 14, path: "assets/icons/bottomicons/calendar0.png"),
                CustomView().printMediumText(fontSize: 10, textData: "১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০"),
              ],
            ),
            Text("আরও বাকি",style: TextStyle(color:ColorHelper.textRed,fontWeight: FontWeight.bold,fontSize: 16.sp),),
            SizedBox(
              width: 200.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomView().singleTextContainer(
                              color:  ColorHelper.textRed, textData: "০", height: 24, width: 24),
                          SpaceHelper.horizontalSpace5,
                          CustomView().singleTextContainer(
                              color:  ColorHelper.textRed, textData: "৫", height: 24, width: 24),

                        ],
                      ),
                      SpaceHelper.verticalSpace5,
                      Text("বছর",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          CustomView().singleTextContainer(
                              color:  ColorHelper.textRed, textData: "০", height: 24, width: 24),
                          SpaceHelper.horizontalSpace5,
                          CustomView().singleTextContainer(
                              color:  ColorHelper.textRed, textData: "৬", height: 24, width: 24),

                        ],
                      ),
                      SpaceHelper.verticalSpace5,
                      Text("মাস",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          CustomView().singleTextContainer(
                              color:  ColorHelper.textRed, textData: "১", height: 24, width: 24),
                          SpaceHelper.horizontalSpace5,
                          CustomView().singleTextContainer(
                              color:  ColorHelper.textRed, textData: "২", height: 24, width: 24),

                        ],
                      ),
                      SpaceHelper.verticalSpace5,
                      Text("দিন",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16.sp),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),

      ],
    );
  }
}
