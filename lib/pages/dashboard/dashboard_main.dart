

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/dashboard/dashboard.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../category_full_view/category_full_view.dart';
import '../meditation/meditation.dart';
import '../music_player/music_player.dart';
import '../sattvic_food/sattvic_food.dart';
import '../subscription_page/subscription_page.dart';
import '../yoga-mudra/yoga_mudra.dart';

class DashboardMain extends StatefulWidget {
  const DashboardMain({Key? key}) : super(key: key);

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {

  var _bottomNavIndex = 0;

  final iconList = [
    "assets/images/Home_normal.png",
    "assets/images/new_icon.png",
    "assets/images/yoga_icon.png",
    "assets/images/hand_icon.png",
  ];
  final selectList = [
    "assets/images/Home.png",
    "assets/images/category_select.png",
    "assets/images/meditation_select.png",
    "assets/images/meditation_select.png",
  ];

  bool? isFloatBtnSelect = false;

  @override
  Widget build(BuildContext context) {
    var screensList = [
      DashBoard(),
      CategoryFullView(),
      MeditationScreen(),
      YogaMudra(),
     // YogaMudra(),
      MusicPlayer(),
      //SattvicFood()
     // SubScriptionPage()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          return GestureDetector(
            onTap: (){
              isFloatBtnSelect = false;
              if(index == 0){
                setState(() {
                  _bottomNavIndex = 0;
                });
              }else if(index == 1){
                setState(() {
                  _bottomNavIndex = 1;
                });
              }else if(index == 2){
                setState(() {
                  _bottomNavIndex = 2;
                });
              }else if(index == 3){
                setState(() {
                  _bottomNavIndex = 3;
                });
              }
            },
            child:  Padding(
              padding: EdgeInsets.only(
                top: displayWidth(context) * 0.02,
                left: displayWidth(context) * 0.02,
              ),
              child: Stack(
                children: [
                  index == _bottomNavIndex  ?  Container(
                    width: displayWidth(context) * 0.11,
                    height: displayWidth(context) * 0.11,
                    decoration: BoxDecoration(
                        color: index == _bottomNavIndex ?  floatingBtnColor : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(displayWidth(context) * 0.06))
                    ),
                  ) : SizedBox(),
                  Positioned(
                    top: displayWidth(context) * 0.01,
                    left: displayWidth(context) * 0.02,
                    child: Image(
                      image: index != _bottomNavIndex ? AssetImage(iconList[index]) as ImageProvider : AssetImage(selectList[index]) as ImageProvider,
                      width: displayWidth(context) * 0.07,
                      height: displayHeight(context) * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        backgroundColor: bottomAppColor,
        activeIndex: _bottomNavIndex,
        splashColor: Colors.yellow,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bottomAppColor,
        foregroundColor: isFloatBtnSelect! ? floatingBtnColor : whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Adjust the value to change the roundness
        ),
        onPressed: () {
         setState(() {
           isFloatBtnSelect = true;
           _bottomNavIndex = 4;

         });
        },
        child: isFloatBtnSelect! ? Icon(Icons.play_circle_filled) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

      body: screensList[_bottomNavIndex],
    );
  }
}
