
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class MostPlayed extends StatefulWidget {
  const MostPlayed({Key? key}) : super(key: key);

  @override
  State<MostPlayed> createState() => _MostPlayedState();
}

class _MostPlayedState extends State<MostPlayed> {

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
    return Padding(
      padding:  EdgeInsets.only(
        left: displayWidth(context) * 0.06,
       // right: displayWidth(context) * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: displayWidth(context) * 0.06,),
          commonText(
              context: context,
              text: 'Most Played',
              fontWeight: FontWeight.w700,
              textColor: blackColor,
              textSize: displayWidth(context) * 0.04,
              textAlign: TextAlign.start),

          SizedBox(height: 8,),

          GridView.builder(
            primary: false,
            shrinkWrap: true,
            // padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
            // padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 6),
            ),
            itemCount: mostPlayedImages.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => GroupFullView()),
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                        image: AssetImage(
                            mostPlayedImages[index]) as ImageProvider,
                      width: displayWidth(context) * 0.1,
                      height: displayWidth(context) * 0.2,
                    ),

                    Padding(
                      padding:  EdgeInsets.only(
                          top: displayWidth(context) * 0.023,
                        left: displayWidth(context) * 0.014
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(
                              context: context,
                              text: mostPlayedTitles[index],
                              fontWeight: FontWeight.w600,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.03,
                              textAlign: TextAlign.start),

                          commonText(
                              context: context,
                              text: mostPlayedSubTitles[index],
                              fontWeight: FontWeight.w400,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.02,
                              textAlign: TextAlign.start),

                          Row(
                            children: [
                              Icon(
                                  Icons.play_circle_filled,
                                color: playBtnColor,
                                size: 10,
                              ),
                              SizedBox(width: displayWidth(context) * 0.01,),
                              Container(
                                  height: 2,
                                  width: displayWidth(context) * 0.2,
                                  child: LinearProgressIndicator(
                                    value: 0.3,
                                    color: playBtnColor,
                                  )
                              ),
                              SizedBox(width: displayWidth(context) * 0.01,),
                              commonText(
                                  context: context,
                                  text: "15 Mins",
                                  fontWeight: FontWeight.w400,
                                  textColor: playBtnColor,
                                  textSize: displayWidth(context) * 0.014,
                                  textAlign: TextAlign.start),
                            ],
                          )
                        ],
                      ),
                    )

                  ],
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
