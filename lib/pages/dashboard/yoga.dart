import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import '../category_full_view/category_full_view.dart';

class Yoga extends StatefulWidget {
  const Yoga({Key? key}) : super(key: key);

  @override
  State<Yoga> createState() => _YogaState();
}

class _YogaState extends State<Yoga> {

  List<String> yogaImages = [
    "assets/images/yoga_asana.png",
    "assets/images/kids_yoga.png",
    "assets/images/breathing.png",
    "assets/images/medical_illness.png",
    "assets/images/happiness.png",
    "assets/images/view_all.png",
  ];

  List<String> yogaNames = [
    "Yoga Asana",
    "Yoga for Kids",
    "Breathing",
    "Medical Illness",
    "Happiness",
    "View All"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: displayWidth(context) * 0.06,
        right: displayWidth(context) * 0.06,
        top: displayWidth(context) * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          commonText(
              context: context,
              text: 'Yoga',
              fontWeight: FontWeight.w700,
              textColor: blackColor,
              textSize: displayWidth(context) * 0.038,
              textAlign: TextAlign.start,
            fontFamily: "Inter"
          ),

          SizedBox(height: displayWidth(context) * 0.04,),

          GridView.builder(
            primary: false,
            shrinkWrap: true,
            // padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
           // padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 3.0),
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
                child: Container(
                 // padding: EdgeInsets.all(2),
                  child: Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 8),
                        child: Image(
                          height: displayWidth(context) * 0.4,
                            image: AssetImage(yogaImages[index]) as ImageProvider
                        ),
                      ),

                      Positioned(
                          left: displayWidth(context) * 0.05,
                          bottom: displayWidth(context) * 0.09,
                          child: commonText(
                              context: context,
                              text: yogaNames[index],
                              fontWeight: FontWeight.w600,
                              textColor: whiteColor,
                              textSize: displayWidth(context) * 0.03,
                              textAlign: TextAlign.start,
                            fontFamily: "Inter"
                          )
                      )
                    ],
                  )
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
