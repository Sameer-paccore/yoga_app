import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  List<String> popularImages = [
    "assets/images/yoga_for_kids.png",
    "assets/images/yoga_for_kids.png"
  ];

  List<String> popularTitles = [
    "Yoga for Kids",
    "Stress Management"
  ];

  List<String> popularSubTitles = [
    "Sub title text",
    "Sub title text",
  ];

  List<String> popularCategories = [
    "Yoga",
    "Meditation",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: displayWidth(context) * 0.06,
        right: displayWidth(context) * 0.06,
        top: displayWidth(context) * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: displayWidth(context) * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                  context: context,
                  text: 'Popular',
                  fontWeight: FontWeight.w700,
                  textColor: blackColor,
                  textSize: displayWidth(context) * 0.04,
                  textAlign: TextAlign.start,fontFamily: "Inter"),

              commonText(
                  context: context,
                  text: 'View All',
                  fontWeight: FontWeight.w400,
                  textColor: viewAllColor,
                  textSize: displayWidth(context) * 0.024,
                  textAlign: TextAlign.start,fontFamily: "Inter"),
            ],
          ),

          SizedBox(height: displayWidth(context) * 0.04,),

          Container(
            height: displayWidth(context) * 0.4,
            width: displayWidth(context),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: popularImages.length,
                itemBuilder: (context,index){
                  return Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 8),
                        child: Image(
                            image: AssetImage(popularImages[index]) as ImageProvider
                        ),
                      ),

                      Positioned(
                          top: displayWidth(context) * 0.25,
                          left: displayWidth(context) * 0.03,
                          //bottom: displayWidth(context) * 0.038,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              commonText(
                                  context: context,
                                  text: popularTitles[index],
                                  fontWeight: FontWeight.w600,
                                  textColor: whiteColor,
                                  textSize: displayWidth(context) * 0.032,
                                  textAlign: TextAlign.start,fontFamily: "Inter"),

                              Row(
                                children: [
                                  commonText(
                                      context: context,
                                      text: popularSubTitles[index],
                                      fontWeight: FontWeight.w100,
                                      textColor: whiteColor,
                                      textSize: displayWidth(context) * 0.022,
                                      textAlign: TextAlign.start,fontFamily: "Inter"),
                                  SizedBox(width: displayWidth(context) * 0.02,),
                                  Container(
                                    width: displayWidth(context) * 0.15,
                                    height: displayWidth(context) * 0.04,
                                    decoration: BoxDecoration(
                                        color: popularColor,
                                        border: Border.all(
                                          color: Colors.transparent
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                    child: Center(
                                      child: commonText(
                                          context: context,
                                          text: popularCategories[index],
                                          fontWeight: FontWeight.w500,
                                          textColor: whiteColor,
                                          textSize: displayWidth(context) * 0.023,
                                          textAlign: TextAlign.start,fontFamily: "Inter"),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: displayWidth(context) * 0.002,),

                              Column(
                                children: [
                                  commonText(
                                      context: context,
                                      text: "3 of 8 Completed",
                                      fontWeight: FontWeight.w300,
                                      textColor: whiteColor,
                                      textSize: displayWidth(context) * 0.02,
                                      textAlign: TextAlign.start,fontFamily: "Inter"),

                                  SizedBox(height: displayWidth(context) * 0.0,),

                                  Container(
                                      height: 2,
                                      width: displayWidth(context) * 0.22,
                                      child: LinearProgressIndicator(
                                        value: 0.3,
                                      )
                                  )
                                ],
                              )


                            ],
                          )
                      ),

                      Positioned(
                        top: displayWidth(context) * 0.31,
                        right: displayWidth(context) * 0.08,
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          commonText(
                              context: context,
                              text: "Start",
                              fontWeight: FontWeight.w600,
                              textColor: whiteColor,
                              textSize: displayWidth(context) * 0.04,
                              textAlign: TextAlign.start,fontFamily: "Inter"),

                          SizedBox(width: displayWidth(context) * 0.01,),

                          Icon(
                            Icons.play_circle_filled_sharp,
                            color: whiteColor,
                            size: displayWidth(context) * 0.05,
                          )
                        ],
                      ),)
                    ],
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
