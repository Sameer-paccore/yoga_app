import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';
import 'package:yoga_app/custom_widgets/utils/common_size_helper.dart';
import 'package:yoga_app/custom_widgets/widgets/common_widgets.dart';
import 'package:yoga_app/pages/dashboard/popular.dart';
import 'package:yoga_app/pages/dashboard/sattvic_energy.dart';
import 'package:yoga_app/pages/dashboard/yoga.dart';

import '../../custom_widgets/custom_appbar.dart';
import '../../custom_widgets/widgets/common_text_search_field.dart';
import '../category_full_view/category_full_view.dart';
import '../courses_full_view/courses_full_view.dart';
import '../meditation/meditation.dart';
import '../meditation/meditation_sub_view.dart';
import '../music_player/music_player.dart';
import '../splash_screen/splash_screen.dart';
import '../subscription_page/subscription_page.dart';
import 'advertisement_card.dart';
import 'categories.dart';
import 'emojis.dart';
import 'most_played.dart';
import 'dart:math' as math;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();



  late Animation<double> borderRadiusAnimation;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          return false;
        },
         child: SafeArea(
             child: Scaffold(
               backgroundColor: whiteColor,
               appBar: CustomAppBar(
                 backgroundColor: Colors.transparent,
                 title:  Container(
                   width: displayWidth(context) * 0.25,
                   height: displayWidth(context) * 0.08,
                   decoration: BoxDecoration(
                       color: blackColor,
                       border: Border.all(),
                       borderRadius: BorderRadius.all(Radius.circular(10))
                   ),
                   child: Center(
                     child: commonText(
                         context: context,
                         text: 'App logo',
                         fontWeight: FontWeight.w500,
                         textColor: whiteColor,
                         textSize: displayWidth(context) * 0.043,
                         textAlign: TextAlign.start),
                   ),
                 ),
               ),
               body: SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: EdgeInsets.only(
                           left: displayWidth(context) * 0.08,
                           right: displayWidth(context) * 0.08,),
                       child: Row(
                         children: [
                           commonText(
                               context: context,
                               text: 'Welcome back ',
                               fontWeight: FontWeight.w300,
                               textColor: blackColor,
                               textSize: displayWidth(context) * 0.03,
                               textAlign: TextAlign.start,
                             fontFamily: "Inter"
                           ),

                           commonText(
                               context: context,
                               text: 'Sameer',
                               fontWeight: FontWeight.w500,
                               textColor: blackColor,
                               textSize: displayWidth(context) * 0.034,
                               textAlign: TextAlign.start,
                               fontFamily: "Inter"),
                         ],
                       ),
                     ),

                     SizedBox(
                       height: displayWidth(context) * 0.02,
                     ),

                     Padding(
                       padding: EdgeInsets.only(left: displayWidth(context) * 0.08,right: displayWidth(context) * 0.08),
                       child: SearchTextField(
                           'Search',
                           searchController,
                           searchFocusNode,
                           false,
                           false, (value) {
                         if (value.length > 3) {
                           // future = commonProvider.getSearchData(
                           //     value, context, scaffoldKey);
                         }
                       }, (value) {
                         /*if (value.length > 3) {
                          future = commonProvider.getSearchData(
                              value, context, scaffoldKey);
                        }*/
                       }, TextInputType.text,
                           textInputAction: TextInputAction.search,
                           enabled: true,
                           isForTwoDecimal: false),
                     ),

                     AdvertisementCard(),

                   //  SizedBox(height: displayWidth(context) * 0.00),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset(
                             "assets/images/Rectangle.png",
                           width: displayWidth(context) * 0.08,
                           height: displayWidth(context) * 0.07,
                         ),
                         SizedBox(width: 7,),
                         commonText(
                             context: context,
                             text: 'How are you feeling today?',
                             fontWeight: FontWeight.w400,
                             textColor: blackColor,
                             textSize: displayWidth(context) * 0.038,
                             textAlign: TextAlign.start),
                       ],
                     ),

                     Emojis(),

                     Categories(),

                     Popular(),

                     Yoga(),

                     MostPlayed(),

                     SattvicEnergy(),
                   ],
                 ),
               ),
             )
         ),
    );
  }
}


