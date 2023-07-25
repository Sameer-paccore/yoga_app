

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/meditation/meditation_sub_view.dart';

import '../../custom_widgets/custom_appbar.dart';
import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_text_search_field.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {

  List<String> yogaTypes = [
    "Beginner",
    "Intermediate",
    "Advance",
  ];

  List<String> yogaImages = [
    "assets/images/meditation_grid_one.png",
    "assets/images/meditation_grid_two.png",
    "assets/images/meditation_grid_three.png",
    "assets/images/meditation_grid_four.png",
    "assets/images/meditation_grid_five.png",
    "assets/images/meditation_grid_six.png",
  ];

  List<String> meditationTitles = [
    "Daily Meditation",
    "5 min Meditation",
    "Meditation for Anxiety",
    "Meditation for positive\nenergy",
    "Meditation for Stress",
    "Meditation for mental\nbalance",
  ];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: whiteColor,
        title: Container(
          width: displayWidth(context) * 0.25,
          height: displayWidth(context) * 0.08,
          decoration: BoxDecoration(
              color: blackColor,
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Center(
            child: commonText(
                context: context,
                text: 'App logo',
                fontWeight: FontWeight.w500,
                textColor: whiteColor,
                textSize: displayWidth(context) * 0.045,
                textAlign: TextAlign.start),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(
                left: displayWidth(context) * 0.08,
                right: displayWidth(context) * 0.08,
              ),
              child: Row(
                children: [
                  commonText(
                      context: context,
                      text: 'Welcome back ',
                      fontWeight: FontWeight.w500,
                      textColor: blackColor,
                      textSize: displayWidth(context) * 0.032,
                      textAlign: TextAlign.start,
                      fontFamily: "Inter"
                  ),

                  commonText(
                      context: context,
                      text: 'Username',
                      fontWeight: FontWeight.w500,
                      textColor: blackColor,
                      textSize: displayWidth(context) * 0.04,
                      textAlign: TextAlign.start,
                      fontFamily: "Inter"),
                ],
              ),
            ),

            SizedBox(height: displayWidth(context) * 0.02,),

            Container(
              height: displayWidth(context) * 0.075,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: yogaTypes.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context,index){
                    return Padding(
                      padding:  EdgeInsets.only(
                        left: displayWidth(context) * 0.06,
                        // right: displayWidth(context) * 0.03
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          // width: displayWidth(context) * 0.25,
                          height: displayWidth(context) * 0.1,
                          decoration: BoxDecoration(
                              color: selectedIndex == index ? floatingBtnColor : yogaTabColor,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  left: displayWidth(context) * 0.03,
                                  right: displayWidth(context) * 0.03
                              ),
                              child: commonText(
                                  context: context,
                                  text: yogaTypes[index],
                                  fontWeight: FontWeight.w400,
                                  textColor: selectedIndex == index ? whiteColor : blackColor,
                                  textSize: displayWidth(context) * 0.03,
                                  textAlign: TextAlign.start),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            SizedBox(
              height: displayWidth(context) * 0.01,
            ),

            Divider(
              height: displayWidth(context) * 0.07,
              thickness: 2,
              color: Colors.grey.withOpacity(0.3),
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


            SizedBox(
              height: displayWidth(context) * 0.025,
            ),

            yogaCategoryGrid(context)
          ],
        ),
      ),
    );
  }

  Widget yogaCategoryGrid(BuildContext context){
    return  GridView.builder(
      primary: false,
      shrinkWrap: true,
      // padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
      // padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: displayWidth(context)  /
            (displayHeight(context) / 2.2),
      ),
      itemCount: yogaImages.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MeditationSubView()),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage(
                        yogaImages[index],
                      ),
                      fit: BoxFit.cover,
                      //  width: displayWidth(context) * 0.5,
                      height: displayHeight(context) * 0.21,
                    ),

                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Stack(
                        children: [
                          Container(
                            height: displayWidth(context) * 0.11,
                            //color: Colors.black.withOpacity(0.5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(18),
                                bottomLeft: Radius.circular(18),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.03,
                                top: displayWidth(context) * 0.01,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonText(
                                          context: context,
                                          text: meditationTitles[index],
                                          fontWeight: FontWeight.w400,
                                          textColor: blackColor,
                                          textSize: displayWidth(context) * 0.022,
                                          textAlign: TextAlign.start,
                                          fontFamily: "Inter"
                                      ),

                                      SizedBox(height: displayWidth(context) * 0.01,),

                                      commonText(
                                          context: context,
                                          text: "3 of 30 Days",
                                          fontWeight: FontWeight.w400,
                                          textColor: Colors.black.withOpacity(0.4),
                                          textSize: displayWidth(context) * 0.015,
                                          textAlign: TextAlign.start,
                                          fontFamily: "Inter"
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: displayWidth(context) * 0.04,
                      right: displayWidth(context) * 0.001,
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.play_circle_filled_sharp),
                        color: floatingBtnColor,
                        iconSize: displayWidth(context) * 0.08,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
