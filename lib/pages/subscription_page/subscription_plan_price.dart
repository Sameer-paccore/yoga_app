
import 'package:flutter/cupertino.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';

import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class SubscriptionPlanPrice extends StatelessWidget {
  final String planIndex;
  SubscriptionPlanPrice({Key? key,required this.planIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(
              context: context,
              text: "\$",
              fontWeight: FontWeight.w500,
              textColor: blackColor,
              textSize: displayWidth(context) * 0.09,
              textAlign: TextAlign.start),
          Column(
            children: [
              commonText(
                  context: context,
                  text: planIndex,
                  fontWeight: FontWeight.w500,
                  textColor: blackColor,
                  textSize: displayWidth(context) * 0.09,
                  textAlign: TextAlign.start),
              commonText(
                  context: context,
                  text: "/Month",
                  fontWeight: FontWeight.w500,
                  textColor: blackColor,
                  textSize: displayWidth(context) * 0.03,
                  textAlign: TextAlign.start),
            ],
          )
        ],
      ),
    );
  }
}
