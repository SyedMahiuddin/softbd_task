
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:softbd_task/Controller/feed_controller.dart';
import 'package:softbd_task/Views/add_new.dart';

import '../Commons/custom_widgets.dart';
import '../consts/colors.dart';
import '../consts/space_helper.dart';

class FeedViewScreen extends StatefulWidget {
   const FeedViewScreen({Key? key}) : super(key: key);

  @override
  State<FeedViewScreen> createState() => _FeedViewScreenState();
}

class _FeedViewScreenState extends State<FeedViewScreen> {
 FeedController feedController =Get.put(FeedController());

   final ScrollController _scrollController = ScrollController();
 void _scrollToIndex(int index) {
   double screenWidth = 320.w;
   double itemWidth = 48.w;
   double targetScrollOffset = (itemWidth * index) - (screenWidth / 2) + (itemWidth / 2);
   _scrollController.animateTo(
     targetScrollOffset,
     duration:const Duration(milliseconds: 100),
     curve: Curves.easeInOut,
   );
 }

 @override
 void initState() {
   super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_) {
     _scrollToIndex(7);
   });
   feedController.selectedDateIndex.value=7;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backWhite,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: _buildTopView(context),
          ),
          Positioned(
            top: 85.h,
              left: 5,
              right: 4,
              child: Column(
                children: [
                  _buildDateHeader(),
                  SpaceHelper.verticalSpace10,
                  _buildDateList(),
                  SpaceHelper.verticalSpace15,
                  _buildStoryList()
                ],
              ))
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
                Icon(Icons.menu,size: 30.sp,),
                CustomView().printHeader(fontSize: 16, textData: "সময়রেখা"),
                CustomView().printImage(height: 32, width: 32, path: "assets/icons/iconImages/notification.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateHeader(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomView().printHeader(fontSize: 16, textData: "আজ, ${feedController.convertToBengaliDate(DateTime.now())}"),
          CustomView().customButton(
              textData: "নতুন যোগ করুন",
              onPressed:() {
                Get.to(const AddNewPage());
              },
              fontSize: 12, borderRadius: 30, height: 29.0,width: 100,elevation: 1)
        ],
      ),
    );
  }

  Widget _buildDateList(){
   return Container(
     width: 318.w,height: 70.h,
     decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.1),
             spreadRadius: 1,
             blurRadius: 1,
             offset:const Offset(0, 1), // changes position of shadow
           ),
         ],
         color: ColorHelper.frontWhite,
         borderRadius: BorderRadius.circular(12)
     ),
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child:ListView.builder(
         physics:const BouncingScrollPhysics(),
           itemCount: feedController.dates.length,
           controller: _scrollController,
           scrollDirection: Axis.horizontal,
           itemBuilder: (BuildContext context, int index) {
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 4.0),
               child: Obx(()=>Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(90),
                   gradient: LinearGradient(
                     colors: feedController.selectedDateIndex.value==index?
                     [ColorHelper.darkGreen, ColorHelper.darkGreen.withOpacity(0.6)]:
                     [Colors.white, Colors.white],
                     begin: Alignment.bottomCenter,
                     end: Alignment.topCenter,
                   ),
                 ),
                 height: 64.h,width: 39.w,
                 child: Padding(
                   padding: const EdgeInsets.all(2.0),
                   child: InkWell(
                     onTap: (){
                       feedController.selectedDateIndex.value=index;
                     },
                     child: Container(
                       decoration: BoxDecoration(
                           color: const Color(0xFFFDFDFD),
                           borderRadius: BorderRadius.circular(90)
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           CustomView().printLightText(fontSize: 14, textData: feedController.dates[index]["day"]),
                           CustomView().printHeader(fontSize: 16, textData: feedController.dates[index]["date"])
                         ],
                       ),
                     ),
                   ),
                 ),
               )),
             );
           }),
     ),
   );
  }

  Widget _buildStoryList(){
   return  Container(
     width: 318.w,height: 380.h,
     decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.1),
             spreadRadius: 1,
             blurRadius: 1,
             offset:const Offset(0, 1),
           ),
         ],
         color: ColorHelper.frontWhite,
         borderRadius: BorderRadius.circular(12)
     ),
     child: Padding(
       padding: const EdgeInsets.all(15.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           CustomView().printHeader(fontSize: 16, textData: "আজকের কার্যক্রম"),
           SpaceHelper.verticalSpace5,
           SizedBox(
             height: 329.h,
             child: Obx(()=>feedController.fetchingStories.value?const Center(child: CircularProgressIndicator(color: ColorHelper.darkGreen,),):
                 ListView.builder(
                 padding: EdgeInsets.zero,
                 physics:const BouncingScrollPhysics(),
                 itemCount: feedController.allStoriesWithDate.length,
                 itemBuilder: (BuildContext context, int index) {
                   var story=feedController.allStoriesWithDate[index].data[0];
                   return Padding(
                     padding: const EdgeInsets.symmetric(vertical: 4.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           children: [
                             CustomView().printMediumText(fontSize: 14, textData: story.date.toString().substring(19,25),color: index%2==0?const Color(
                                 0xFF202020):const Color(0xFF2A61EE)),
                             CustomView().printMediumText(fontSize: 14, textData: story.date.toString().substring(0,5),color: index%2==0?const Color(
                                 0xFF202020):const Color(0xFF2A61EE))
                           ],
                         ),
                         Container(
                           width:207.w, height:150.h,
                           decoration: BoxDecoration(
                               gradient: LinearGradient(
                                 colors: index%2==0?
                                 [ColorHelper.darkGreen, ColorHelper.lightGreen]:
                                 [Colors.black, Colors.black],
                                 begin: Alignment.bottomRight,
                                 end: Alignment.topLeft,
                               ),
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     Icon(Icons.access_time,color: Colors.white,size: 15.sp,),
                                     SpaceHelper.horizontalSpace5,
                                     CustomView().printMediumText(fontSize: 12, textData: story.date.toString().substring(0,5),color: Colors.white)
                                   ],
                                 ),
                                 SizedBox(
                                   height: 70.h,
                                   child: CustomView().printMediumText(fontSize: 14,
                                       textData:story.name,color: Colors.white ),
                                 ),
                                 CustomView().printMediumText(fontSize: 12, textData: story.category,color: Colors.white),
                                 Row(
                                   children: [
                                     Icon(Icons.location_on_outlined,color: Colors.white,size: 15.sp,),
                                     SpaceHelper.horizontalSpace5,
                                     CustomView().printMediumText(fontSize: 12, textData: story.location,color: Colors.white)
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         )
                       ],
                     ),
                   );
                 })),
           )
         ],
       ),
     ),
   );
  }
}
