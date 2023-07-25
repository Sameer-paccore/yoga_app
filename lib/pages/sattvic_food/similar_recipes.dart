
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class SimilarRecipes extends StatefulWidget {
  const SimilarRecipes({Key? key}) : super(key: key);

  @override
  State<SimilarRecipes> createState() => _SimilarRecipesState();
}

class _SimilarRecipesState extends State<SimilarRecipes> {

  List<String> sattvicEnergyImages = [
    "assets/images/sattvic_one.png",
    "assets/images/sattvic_two.png",
  ];

  List<String> sattvicEnergyItems = [
    "Calories",
    "Protein",
    "Carbs",
    "Fiber"
  ];

  List<String> sattvicEnergyItemsQty = [
    "236",
    "98",
    "120",
    "36"
  ];

  List<String> sattvicEnergyTitles = [
    "MUNG DAL, COCONUT & CILANTRO KITCHARI",
    "CARROTS WITH LEMON & HONEY",
  ];

  List<String> sattvicEnergySubTitles = [
    "Yoga is not just about exercise, it’s a way of life. And this life also includes eating a wholesome diet with sattvic foods.",
    "Yoga is not just about exercise, it’s a way of life. And this life also includes eating a wholesome diet with sattvic foods.",
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
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                  context: context,
                  text: 'Similar Recipes',
                  fontWeight: FontWeight.w700,
                  textColor: blackColor,
                  textSize: displayWidth(context) * 0.04,
                  textAlign: TextAlign.start,fontFamily: "Inter"),

              SizedBox(width: displayWidth(context) * 0.45,),
              commonText(
                  context: context,
                  text: 'View All',
                  fontWeight: FontWeight.w500,
                  textColor: viewAllColor,
                  textSize: displayWidth(context) * 0.03,
                  textAlign: TextAlign.start,fontFamily: "Inter"),

            ],
          ),

          Container(
            //  height: displayWidth(context) * 0.42,
            child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              // padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
              // padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.25),
              ),
              itemCount: sattvicEnergyImages.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => GroupFullView()),
                      // );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: displayWidth(context) * 0.03),
                      child: Container(
                        // height: displayHeight(context) * 0.3,
                        decoration: BoxDecoration(
                            color: popularChefBackgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: displayWidth(context) * 0.01),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: displayWidth(context) * 0.01),
                                child: Stack(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          sattvicEnergyImages[index]) as ImageProvider,
                                      // width: displayHeight(context) * 0.4,
                                      //  height: displayHeight(context) * 0.15,
                                    ),
                                    Positioned(
                                        top: displayHeight(context) * 0.08,
                                       //  bottom: displayHeight(context) * 0.01,
                                        // left: 50,
                                        child:  sattvicFoodItems(context))
                                  ],
                                ),
                              ),

                              Column(
                                children: [
                                  commonText(
                                      context: context,
                                      text: sattvicEnergyTitles[index],
                                      fontWeight: FontWeight.w600,
                                      textColor: blackColor,
                                      textSize: displayWidth(context) * 0.032,
                                      textAlign: TextAlign.start),

                                  SizedBox(height: 5,),

                                  commonText(
                                      context: context,
                                      text: sattvicEnergySubTitles[index],
                                      fontWeight: FontWeight.w400,
                                      textColor: blackColor,
                                      textSize: displayWidth(context) * 0.022,
                                      textAlign: TextAlign.start),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    )
                );
              },
            ),
          ),
          SizedBox(height: displayWidth(context) * 0.06,)
        ],
      ),
    );
  }

  Widget sattvicFoodItems(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: displayWidth(context) * 0.02),
      child: Container(
        height: displayHeight(context) * 0.45,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: sattvicEnergyItems.length,
            itemBuilder: (context,index){
              return Container(
                // height: 100,
                child: Row(
                  children: [
                    Column(
                      children: [
                        commonText(
                            context: context,
                            text: sattvicEnergyItems[index],
                            fontWeight: FontWeight.w500,
                            textColor: whiteColor,
                            textSize: displayWidth(context) * 0.017,
                            textAlign: TextAlign.start),

                        commonText(
                            context: context,
                            text: sattvicEnergyItemsQty[index],
                            fontWeight: FontWeight.w400,
                            textColor: whiteColor,
                            textSize: displayWidth(context) * 0.04,
                            textAlign: TextAlign.start),
                      ],
                    ),
                    index != sattvicEnergyItemsQty.length-1 ?  VerticalDivider(
                      thickness: 1,
                      color: Colors.grey,
                    ) : Container()
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
