

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/category_full_view/category_full_view.dart';
import 'package:yoga_app/pages/meditation/meditation.dart';
import 'package:yoga_app/pages/sattvic_food/sattvic_food.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import '../yoga-mudra/yoga_mudra.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<String> categoryImages = [
    "assets/images/yoga.png",
    "assets/images/meditation.png",
    "assets/images/sattvic food.png",
    "assets/images/breath.png",
    "assets/images/mudras.png",
  ];

  List<String> categoryNames = [
    "   Yoga",
    "Meditation",
    "Sattvic Food",
    "Breath",
    "Mudras"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        left: displayWidth(context) * 0.06,
        right: displayWidth(context) * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(
              context: context,
              text: 'Categories',
              fontWeight: FontWeight.w500,
              textColor: blackColor,
              textSize: displayWidth(context) * 0.04,
              textAlign: TextAlign.start,
            fontFamily: "Inter"
          ),

          SizedBox(height: 8,),

          Container(
            height: displayWidth(context) * 0.4,
            width: displayWidth(context),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoryImages.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      if(index == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryFullView()));
                      } else if(index == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MeditationScreen()));
                      } else if(index == 2){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SattvicFood()));
                      }else if(index == 4){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => YogaMudra()));
                      }
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(right: 8),
                          child: Image(
                              image: AssetImage(categoryImages[index]) as ImageProvider
                          ),
                        ),

                        Positioned(
                          left: displayWidth(context) * 0.09,
                          bottom: displayWidth(context) * 0.03,
                            child: commonText(
                                context: context,
                                text: categoryNames[index],
                                fontWeight: FontWeight.w600,
                                textColor: blackColor,
                                textSize: displayWidth(context) * 0.033,
                                textAlign: TextAlign.start,fontFamily: "Inter")
                        )
                      ],
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
