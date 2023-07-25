
import 'package:flutter/cupertino.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class PopularChefs extends StatefulWidget {
  const PopularChefs({Key? key}) : super(key: key);

  @override
  State<PopularChefs> createState() => _PopularChefsState();
}

class _PopularChefsState extends State<PopularChefs> {

  List<String> popularChefsNames = [
    "Grand mam\nrecipies by\nTrakdial",
    "Grand mam\nrecipies by\nTrakdial",
    "Grand mam\nrecipies by\nTrakdial",
    "Grand mam\nrecipies by\nTrakdial",
    "Grand mam\nrecipies by\nTrakdial",
    "Grand mam\nrecipies by\nTrakdial",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayWidth(context) * 0.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: popularChefsNames.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(
               // left: displayWidth(context) * 0.015,
                right: displayWidth(context) * 0.015,
              ),
              child: Container(
                width: displayWidth(context) * 0.29,
                decoration: BoxDecoration(
                  color: popularChefBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: displayWidth(context) * 0.03,
                    ),
                    commonCircleImage(context, displayWidth(context) * 0.1,
                        floatingBtnColor, "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg"),
                    SizedBox(
                      height: displayWidth(context) * 0.01,
                    ),
                    Container(
                      width: displayWidth(context) * 0.2,
                      height: displayWidth(context) * 0.09,
                      child: commonText(
                          context: context,
                          text: popularChefsNames[index],
                          fontWeight: FontWeight.w600,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.022,
                          textAlign: TextAlign.center,fontFamily: "Inter"),
                    ),


                    SizedBox(
                      height: displayWidth(context) * 0.02,
                    ),

                    commonText(
                        context: context,
                        text: 'Yoga is not just about\nexercise, it’s a way of life.\nAnd this life also includes\neating a wholesome diet\nwith sattvic foods.',
                        fontWeight: FontWeight.w600,
                        textColor: blackColor.withOpacity(0.6),
                        textSize: displayWidth(context) * 0.02,
                        textAlign: TextAlign.center,fontFamily: "Inter"),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
