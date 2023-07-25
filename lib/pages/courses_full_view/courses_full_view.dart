import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class CoursesFullView extends StatefulWidget {
  const CoursesFullView({Key? key}) : super(key: key);

  @override
  State<CoursesFullView> createState() => _CoursesFullViewState();
}

class _CoursesFullViewState extends State<CoursesFullView> {
  List<String> musicListNumbers = [
    "01","02","03","04"
  ];

  List<String> musicListPointsNumbers = [
    "1. ","2. ","3. ","4. "
  ];

  List<String> musicListTitles = [
    "Pose Name",
    "Pose Name",
    "Pose Name",
    "Pose Name",
  ];

  List<String> musicListSubTitles = [
    "3 Mins",
    "3 Mins",
    "3 Mins",
    "3 Mins",
  ];

  List<String> musicListPoints = [
  "Do it: Plank pose is good if you are looking to tone your abs and build strength in your upper body.",
  "Skip it: Avoid plank pose if you suffer from carpal tunnel syndrome. It can be hard on your wrists. You might also skip it or modify if you have low back pain.",
  "Modify: You can modify it by placing your knees on the floor.",
  "Be mindful: As you do a plank, imagine the back of your neck and spine lengthening."
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage("assets/images/meditation_course.png") as ImageProvider,
                 // height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: displayWidth(context) * 0.1,
                  left: displayWidth(context) * 0.06,
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
                          fontWeight: FontWeight.w500,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.04,
                          textAlign: TextAlign.start,
                        fontFamily: "Inter"
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: displayHeight(context) * 0.41),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: displayWidth(context),
                          //height: displayHeight(context),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(displayWidth(context) * 0.14),
                              topLeft: Radius.circular(displayWidth(context) * 0.125),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.08,
                              right: displayWidth(context) * 0.08,
                              top: displayWidth(context) * 0.07,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    commonText(
                                        context: context,
                                        text: "Power Yoga",
                                        fontWeight: FontWeight.w500,
                                        textColor: blackColor,
                                        textSize: displayWidth(context) * 0.05,
                                        textAlign: TextAlign.start,
                                      fontFamily: "Inter"
                                    ),
                                    commonText(
                                        context: context,
                                        text: "3 of 4 poses",
                                        fontWeight: FontWeight.w500,
                                        textColor: floatingBtnColor,
                                        textSize: displayWidth(context) * 0.029,
                                        textAlign: TextAlign.start,
                                        fontFamily: "Inter"
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: displayWidth(context) * 0.04,
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
                                    width: displayWidth(context) * 0.8,
                                    child: LinearProgressIndicator(
                                      value: 0.8,
                                    )
                                ),

                                expansionTile(context),


                              ],
                            ),
                          ),
                        ),
                        recommendedSubliminal(context)
                      ],
                    ),
                  ),
                )

              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget recommendedSubliminal(BuildContext context){
    return Container(
      color: bottomAppColor,
      child: Padding(
        padding: EdgeInsets.only(
          left: displayWidth(context) * 0.08,
          right: displayWidth(context) * 0.08,
          top: displayWidth(context) * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayWidth(context) * 0.06),
            commonText(
                context: context,
                text: "Recommended Subliminal",
                fontWeight: FontWeight.w600,
                textColor: blackColor,
                textSize: displayWidth(context) * 0.037,
                textAlign: TextAlign.start,
              fontFamily: "Inter"
            ),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: mostPlayedImages.length,
                itemBuilder: (context,index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                              mostPlayedImages[index]) as ImageProvider,
                          width: displayWidth(context) * 0.13,
                          height: displayWidth(context) * 0.18,
                        ),

                        Padding(
                          padding:  EdgeInsets.only(
                              top: displayWidth(context) * 0.02,
                              left: displayWidth(context) * 0.03
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText(
                                  context: context,
                                  text: mostPlayedTitles[index],
                                  fontWeight: FontWeight.w600,
                                  textColor: blackColor,
                                  textSize: displayWidth(context) * 0.038,
                                  textAlign: TextAlign.start,
                                fontFamily: "Inter"
                              ),

                              commonText(
                                  context: context,
                                  text: mostPlayedSubTitles[index],
                                  //fontWeight: FontWeight.w100,
                                  textColor: blackColor,
                                  textSize: displayWidth(context) * 0.022,
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
                              left: displayWidth(context) * 0.12
                          ),
                          child: Icon(
                            Icons.play_circle_filled,
                            color: playBtnColor,
                            size: displayWidth(context) * 0.045,
                          ),
                        ),

                      ],
                    );
                }
            )
          ],
        ),
      ),
    );
  }

  Widget expansionTile(BuildContext context){
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: musicListPoints.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.only(bottom: displayWidth(context) * 0.02),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(displayWidth(context) * 0.04),
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                subtitle: commonText(
                    context: context,
                    text: musicListSubTitles[index],
                    fontWeight: FontWeight.w500,
                    textColor: blackColor,
                    textSize: displayWidth(context) * 0.02,
                    textAlign: TextAlign.start,
                    fontFamily: "Inter"
                ),
                title: commonText(
                    context: context,
                    text: musicListTitles[index],
                    fontWeight: FontWeight.w500,
                    textColor: blackColor,
                    textSize: displayWidth(context) * 0.035,
                    textAlign: TextAlign.start,
                    fontFamily: "Inter"),
                leading: Padding(
                  padding:  EdgeInsets.only(top: displayWidth(context)* 0.01),
                  child: commonText(
                      context: context,
                      text: musicListNumbers[index],
                      fontWeight: FontWeight.w500,
                      textColor: blackColor,
                      textSize: displayWidth(context) * 0.03,
                      textAlign: TextAlign.start,
                      fontFamily: "Inter"),
                ),
                trailing: Icon(
                  Icons.check_circle,
                  size: displayWidth(context) * 0.052,
                  color: floatingBtnColor,
                ),
                children: <Widget>[
                  musicPointsList(context)
                ],
              ),
            ),
          ),
        );
      });
  }

  Widget musicPointsList(BuildContext context){
    return Padding(
      padding:  EdgeInsets.only(
          left: displayWidth(context) * 0.06,
      ),
      child: SizedBox(
        height: displayWidth(context) * 0.37,
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: musicListPoints.length,
            itemBuilder: (context,index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                      context: context,
                      text: musicListPointsNumbers[index],
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black.withOpacity(0.7),
                      textSize: displayWidth(context) * 0.027,
                      textAlign: TextAlign.start,fontFamily: "Inter"),
                  Container(
                    width: displayWidth(context) * 0.72,
                    child: commonText(
                        context: context,
                        text: musicListPoints[index],
                        fontWeight: FontWeight.w500,
                        textColor: Colors.black.withOpacity(0.7),
                        textSize: displayWidth(context) * 0.025,
                        textAlign: TextAlign.start,fontFamily: "Inter"),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
