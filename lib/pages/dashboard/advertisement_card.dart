import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';
import 'package:yoga_app/custom_widgets/utils/common_size_helper.dart';

import '../../custom_widgets/widgets/common_widgets.dart';

class AdvertisementCard extends StatefulWidget {
  const AdvertisementCard({Key? key}) : super(key: key);

  @override
  State<AdvertisementCard> createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: displayWidth(context) * 0.06,
          right: displayWidth(context) * 0.06,
          top: displayWidth(context) * 0.03
      ),
      child: Container(
        width: displayWidth(context),
        height: displayHeight(context) * 0.187,
        decoration: BoxDecoration(
         // color: Colors.blue[400],
          borderRadius: BorderRadius.circular(30),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.blue.withOpacity(0.3),
          //     offset: Offset(0, 2),
          //     blurRadius: 6,
          //   ),
          // ],
        ),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/ads_card.png",
            ),

            Padding(
              padding: EdgeInsets.only(
                left: displayWidth(context) * 0.05
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonText(
                      context: context,
                      text: 'Yoga for \nmental health',
                      fontWeight: FontWeight.w600,
                      textColor: blackColor,
                      textSize: displayWidth(context) * 0.045,
                      textAlign: TextAlign.start,
                      fontFamily: "Inter"),

                  SizedBox(height: displayWidth(context) * 0.014,),

                  commonText(
                      context: context,
                      text: 'Subtext paragraph with short discription',
                      fontWeight: FontWeight.w300,
                      textColor: blackColor,
                      textSize: displayWidth(context) * 0.015,
                      textAlign: TextAlign.start,
                      fontFamily: "Inter"),

                  SizedBox(height: displayWidth(context) * 0.03,),

                  Row(
                    children: [
                      Container(
                        width: displayWidth(context) * 0.18,
                        height: displayWidth(context) * 0.05,
                        decoration: BoxDecoration(
                            color: blackColor,
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                        child: Center(
                          child: commonText(
                              context: context,
                              text: 'Subscribe Now',
                              fontWeight: FontWeight.w500,
                              textColor: whiteColor,
                              textSize: displayWidth(context) * 0.016,
                              textAlign: TextAlign.start,
                              fontFamily: "Inter"),
                        ),
                      ),

                      SizedBox(width: displayWidth(context) * 0.01,),

                      commonText(
                          context: context,
                          text: '20% Off for new user',
                          fontWeight: FontWeight.w300,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.017,
                          textAlign: TextAlign.start,
                          fontFamily: "Inter"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
