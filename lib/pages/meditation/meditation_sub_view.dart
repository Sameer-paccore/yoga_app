

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/meditation/set_timer.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_buttons.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class MeditationSubView extends StatefulWidget {
  const MeditationSubView({Key? key}) : super(key: key);

  @override
  State<MeditationSubView> createState() => _MeditationSubViewState();
}

class _MeditationSubViewState extends State<MeditationSubView> {

  List<String> mostPlayedImages = [
    "assets/images/by_the_lake.png",
    "assets/images/mantras.png",
    "assets/images/lo_fi.png",
    "assets/images/fall_into_peace.png",
  ];

  List<String> mostPlayedTitles = [
    "By the lake",
    "Mantras",
    "Lo-Fi",
    "Fall into peace",
  ];

  List<String> mostPlayedSubTitles = [
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: meditationBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: displayWidth(context) * 0.07,),
            Stack(
              children: [
                Image(
                  image: AssetImage("assets/images/medi_image.png") as ImageProvider,
                  // height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: displayWidth(context) * 0.02,
                  left: displayWidth(context) * 0.04,
                  child: Row(
                    children: [
                      Container(
                        height: displayWidth(context) * 0.12,
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                          iconSize: 15,
                          color: blackColor,
                        ),
                      ),

                      commonText(
                          context: context,
                          text: "Meditation",
                          fontWeight: FontWeight.w700,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.035,
                          textAlign: TextAlign.start,
                          fontFamily: "Inter"
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SingleChildScrollView(
              child: Container(
                color: meditationBackgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: displayWidth(context) * 0.01,
                    ),

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.fast_rewind),
                            color: bottomAppColor,
                            iconSize: displayWidth(context) * 0.08,
                          ),
                          IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.play_circle_filled_sharp),
                            color: bottomAppColor,
                            iconSize: displayWidth(context) * 0.08,
                          ),
                          IconButton(
                            onPressed: (){

                            },
                            icon: Icon(Icons.fast_forward),
                            color: bottomAppColor,
                            iconSize: displayWidth(context) * 0.08,
                          )
                        ],
                      ),
                    ),

                    Container(
                        height: 4,
                        width: displayWidth(context) * 0.7,
                        child: LinearProgressIndicator(
                          value: 0.8,
                        )
                    ),

                    Padding(
                      padding:  EdgeInsets.only(
                        left: displayWidth(context) * 0.136,
                        right: displayWidth(context) * 0.136,
                        top: displayWidth(context) * 0.03,
                      ),
                      child: Container(
                        height: displayHeight(context) * 0.245,
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: mostPlayedImages.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: EdgeInsets.only(bottom: displayWidth(context) * 0.03),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          mostPlayedImages[index]) as ImageProvider,
                                      width: displayWidth(context) * 0.13,
                                      height: displayWidth(context) * 0.12,
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(
                                          left: displayWidth(context) * 0.02
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          commonText(
                                              context: context,
                                              text: mostPlayedTitles[index],
                                              fontWeight: FontWeight.w600,
                                              textColor: blackColor,
                                              textSize: displayWidth(context) * 0.036,
                                              textAlign: TextAlign.start,
                                              fontFamily: "Inter"
                                          ),

                                          commonText(
                                              context: context,
                                              text: mostPlayedSubTitles[index],
                                              //fontWeight: FontWeight.w100,
                                              textColor: blackColor,
                                              textSize: displayWidth(context) * 0.02,
                                              textAlign: TextAlign.start,
                                              fontFamily: "Inter"),

                                          commonText(
                                              context: context,
                                              text: "15 Mins",
                                              fontWeight: FontWeight.w100,
                                              textColor: playBtnColor,
                                              textSize: displayWidth(context) * 0.018,
                                              textAlign: TextAlign.start,
                                              fontFamily: "Inter")
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding:  EdgeInsets.only(
                                          top: displayWidth(context) * 0.032,
                                          left: displayWidth(context) * 0.17
                                      ),
                                      child: Icon(
                                        Icons.play_circle_filled,
                                        color: playBtnColor,
                                        size: displayWidth(context) * 0.043,
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            CommonButtons.getActionButton(
                title: 'Set Timer',
                context: context,
                fontSize: displayWidth(context) * 0.042,
                textColor: Colors.white,
                buttonPrimaryColor: floatingBtnColor,
                borderColor: Colors.transparent,
                width: displayWidth(context) * 0.8,
                onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetTimer()));
                }
            ),

            SizedBox(
              height: displayWidth(context) * 0.03,
            )

          ],
        ),
      ),
    );
  }
}
