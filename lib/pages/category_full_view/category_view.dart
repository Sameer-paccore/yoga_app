

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/courses_full_view/courses_full_view.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  List<String> yogaTypes = [
    "All",
    "Kundalini Yoga",
    "Vinyasa Yoga",
    "Power Yoga",
    "Hatha Yoga",
  ];

  List<String> yogaTitles = [
    "Yoga for Kids",
    "Yoga for Beginners",
    "Yoga for Diabetic",
    "Yoga for Better ",
  ];

  List<String> yogaImages = [
    "assets/images/yoga_category_one.png",
    "assets/images/yoga.png",
    "assets/images/yoga_category_two.png",
    "assets/images/yoga_category_three.png",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: displayWidth(context) * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonText(
                context: context,
                text: "“Yoga is 99% practice & 1% theory”– ",
                fontWeight: FontWeight.w600,
                textColor: blackColor,
                textSize: displayWidth(context) * 0.036,
                textAlign: TextAlign.start,
              fontFamily: "Inter"
            ),
            commonText(
                context: context,
                text: "Sri K",
                fontWeight: FontWeight.w400,
                textColor: blackColor,
                textSize: displayWidth(context) * 0.036,
                textAlign: TextAlign.start,
              fontFamily: "Inter"
            ),
          ],
        ),
        SizedBox(
          height: displayWidth(context) * 0.05,
        ),
        tabs(context),
        SizedBox(
          height: displayWidth(context) * 0.04,
        ),
        yogaCategoryGrid(context)
      ],
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
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.2),
      ),
      itemCount: yogaImages.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => CategoryFullView()),
            // );
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.07,
            ),
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
                        child: Container(
                          height: displayWidth(context) * 0.1,
                          //color: Colors.black.withOpacity(0.5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
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
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      commonText(
                                          context: context,
                                          text: yogaTitles[index],
                                          fontWeight: FontWeight.w400,
                                          textColor: whiteColor,
                                          textSize: displayWidth(context) * 0.02,
                                          textAlign: TextAlign.start,
                                          fontFamily: "Inter"
                                      ),

                                      commonText(
                                          context: context,
                                          text: "3 of 30 Days",
                                          fontWeight: FontWeight.w400,
                                          textColor: whiteColor,
                                          textSize: displayWidth(context) * 0.018,
                                          textAlign: TextAlign.start,
                                        fontFamily: "Inter"
                                      ),

                                      SizedBox(height: displayWidth(context) * 0.02,),

                                      Container(
                                          height: 2,
                                          width: displayWidth(context) * 0.14,
                                          child: LinearProgressIndicator(
                                            value: 0.3,
                                          )
                                      )
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(
                                    left: displayWidth(context) *0.03,
                                    top: displayWidth(context) *0.01,
                                  ),
                                  child: Container(
                                    width: displayWidth(context) * 0.13,
                                    height: displayWidth(context) * 0.05,
                                    decoration: BoxDecoration(
                                        color: floatingBtnColor,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          left: displayWidth(context) * 0.03,
                                          right: displayWidth(context) * 0.03
                                      ),
                                      child: Center(
                                        child: commonText(
                                            context: context,
                                            text: "Start",
                                            fontWeight: FontWeight.w500,
                                            textColor: whiteColor,
                                            textSize: displayWidth(context) * 0.023,
                                            textAlign: TextAlign.start),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget tabs(BuildContext context){
    return Padding(
      padding:  EdgeInsets.only(
        left: displayWidth(context) * 0.04,
        // right: displayWidth(context) * 0.03
      ),
      child: Container(
        height: displayWidth(context) * 0.07,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: yogaTypes.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.only(
                    left: displayWidth(context) * 0.02,
                   // right: displayWidth(context) * 0.03
                ),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                    if(yogaTypes[index] == "Power Yoga"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesFullView()));
                    }
                  },
                  child: Container(
                   // width: displayWidth(context) * 0.25,
                    height: displayWidth(context) * 0.1,
                    decoration: BoxDecoration(
                        color: selectedIndex != index ? yogaTabColor : yogaTabNewColor,
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
                            textColor: blackColor,
                            textSize: displayWidth(context) * 0.03,
                            textAlign: TextAlign.start,
                          fontFamily: "Inter"
                        ),
                      ),
                    ),
                  ),
                ),
              );
        }),
      ),
    );
  }
}
