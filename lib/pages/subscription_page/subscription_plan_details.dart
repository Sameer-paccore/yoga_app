import 'package:flutter/material.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';

import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class SubscriptionPlanDetails extends StatelessWidget {
  List<String> planList;

  SubscriptionPlanDetails(this.planList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: displayWidth(context) * 0.06 ),
      child: Container(
        width: displayWidth(context) * 0.5,
        height: displayHeight(context) * 0.17,
        child: Column(
          children: planList.map((str) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                    context: context,
                    text: '• ',
                    fontWeight: FontWeight.w500,
                    textColor: blackColor,
                    textSize: displayWidth(context) * 0.03,
                    textAlign: TextAlign.start),
                Expanded(
                  child: Container(
                    width: displayWidth(context) * 0.55,
                    child: commonText(
                        context: context,
                        text: str,
                        fontWeight: FontWeight.w500,
                        textColor: blackColor,
                        textSize: displayWidth(context) * 0.025,
                        textAlign: TextAlign.start,fontFamily: "Inter"),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}