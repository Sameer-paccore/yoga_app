import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/subscription_page/subscription_plan_details.dart';
import 'package:yoga_app/pages/subscription_page/subscription_plan_price.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class SubScriptionPage extends StatefulWidget {
  const SubScriptionPage({Key? key}) : super(key: key);

  @override
  State<SubScriptionPage> createState() => _SubScriptionPageState();
}

class _SubScriptionPageState extends State<SubScriptionPage> {

  List planTypes = [
    "Free trail",
    "Standard",
    "Premium",
  ];

  List planOffer = [
    "Limited features free for lifetime",
    "Limited features free for lifetime",
    "Limited features free for lifetime",
  ];

  List popularPlanFlags = [false,true,false,false,false];

  List planPrices = [
    "0","9","30"
  ];

  List<SubscriptionPlanDetails> planDetails = [
    SubscriptionPlanDetails(["deepen their yoga practice","properly learn all of the yoga postures and poses","study ancient text like the Bhagavad Gita or Yoga Sutras","to be able to construct their own personalized classes"]),
    SubscriptionPlanDetails(["deepen their yoga practice","properly learn all of the yoga postures and poses","study ancient text like the Bhagavad Gita or Yoga Sutras","to be able to construct their own personalized classes"]),
    SubscriptionPlanDetails(["deepen their yoga practice","properly learn all of the yoga postures and poses","study ancient text like the Bhagavad Gita or Yoga Sutras","to be able to construct their own personalized classes"]),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
            //  Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            //size: 20,
            color: blackColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: displayWidth(context) * 0.04,
              ),
              commonText(
                  context: context,
                  text: "Pricing Plan",
                  fontWeight: FontWeight.w400,
                  textColor: blackColor,
                  textSize: displayWidth(context) * 0.09,
                  textAlign: TextAlign.start,fontFamily: "Inter"),

              Padding(
                padding: EdgeInsets.only(
                  left: displayWidth(context) * 0.2,
                  right: displayWidth(context) * 0.2,
                  top: displayWidth(context) * 0.03
                ),
                child: commonText(
                    context: context,
                    text: "Choose a subscription plan to unlock all the functionally of the application",
                    fontWeight: FontWeight.w500,
                    textColor: blackColor,
                    textSize: displayWidth(context) * 0.03,
                    textAlign: TextAlign.center,fontFamily: "Inter"),
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.06,
                    right: displayWidth(context) * 0.06,
                    top: displayWidth(context) * 0.06
                ),
                child: ListView.builder(
                    itemCount: planTypes.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                               color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(displayWidth(context) * 0.08)
                        ),
                        color: bottomAppColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: displayWidth(context) * 0.01,),
                            Padding(
                              padding: EdgeInsets.only(left: displayWidth(context) * 0.06),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: commonText(
                                            context: context,
                                            text: planTypes[index],
                                            fontWeight: FontWeight.w700,
                                            textColor: blackColor,
                                            textSize: displayWidth(context) * 0.045,
                                            textAlign: TextAlign.start,fontFamily: "Inter"),
                                      ),
                                      commonText(
                                          context: context,
                                          text: planOffer[index],
                                          //fontWeight: FontWeight.w100,
                                          textColor: blackColor,
                                          textSize: displayWidth(context) * 0.026,
                                          textAlign: TextAlign.start,fontFamily: "Inter"),
                                    ],
                                  ),
                                  SizedBox(width: displayWidth(context) * 0.14,),
                                  SubscriptionPlanPrice(planIndex: planPrices[index])
                                ],
                              ),
                            ),

                            planDetails[index]

                          ],
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
