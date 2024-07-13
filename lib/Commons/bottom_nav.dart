
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softbd_task/Commons/custom_widgets.dart';
import 'package:softbd_task/Controller/view_controller.dart';
import 'package:softbd_task/Views/home_page.dart';
import 'package:softbd_task/consts/colors.dart';

import '../Views/feed_view.dart';

class BottomNav extends StatelessWidget {
   BottomNav({Key? key}) : super(key: key);

 final ViewController viewController=Get.put(ViewController());

   final List<Widget> _screens = [
     HomePage(),
     const FeedViewScreen(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>_screens[viewController.pageIndex.value]),
      bottomNavigationBar: SizedBox(
        height: 99.h,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
                height: 99.h,
                width: MediaQuery.of(context).size.width,
              color:ColorHelper.backWhite,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildNavigators(context),
            ),
            Positioned(
                top: 6.h,
                left: (MediaQuery.of(context).size.width/2)-34.w,
                child: _buildCameraButton())
          ],
        ),
      ),
    );
  }

  
  Widget _buildNavigators(BuildContext context){
    return Container(
      height: 65.h,
      width: MediaQuery.of(context).size.width,
      decoration:const BoxDecoration(
          color: ColorHelper.frontWhite,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width/3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(()=>InkWell(
                    onTap:(){
                      viewController.pageIndex.value=0;
                    },
                    child: CustomView().printImage(height: 20, width: 20,
                        path:viewController.pageIndex.value==0? "assets/icons/bottomicons/home1.png":
                        "assets/icons/bottomicons/home0.png"))),
                Obx(()=> InkWell(
                   onTap: (){
                     viewController.pageIndex.value=1;
                   },
                   child: CustomView().printImage(height: 20, width: 20,
                       path:viewController.pageIndex.value==1? "assets/icons/bottomicons/calendar1.png":
                       "assets/icons/bottomicons/calendar0.png"))),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomView().printImage(height: 20, width: 20, path: "assets/icons/bottomicons/home4.png"),
                CustomView().printImage(height: 20, width: 20, path: "assets/icons/bottomicons/home5.png"),
              ],
            ),
          )
        ],
      ) ,
    );
  }
  
  Widget _buildCameraButton(){
    return Container(
      height: 68.w,width: 68.w,
      decoration: BoxDecoration(
        color: ColorHelper.backWhite,
        borderRadius: BorderRadius.circular(90),
      ),
      child:Center(
        child: Container(
          height: 56.w,width: 56.w,
          decoration: BoxDecoration(
            gradient:const LinearGradient(
              colors: [ColorHelper.lightGreen, ColorHelper.darkGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(90),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Image.asset( height: 32.w,width: 32.w,'assets/icons/bottomicons/camera.png',fit: BoxFit.cover,),
          ),
        ),
      ) ,
    );
  }
}
