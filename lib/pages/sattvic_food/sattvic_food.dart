import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/pages/sattvic_food/popular_chefs.dart';
import 'package:yoga_app/pages/sattvic_food/similar_recipes.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import 'grand_mom_recipes.dart';

class SattvicFood extends StatefulWidget {
  const SattvicFood({Key? key}) : super(key: key);

  @override
  State<SattvicFood> createState() => _SattvicFoodState();
}

class _SattvicFoodState extends State<SattvicFood> {

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
    "MUNG DAL, COCONUT &\nCILANTRO KITCHARI",
  ];

  List<String> sattvicEnergySubTitles = [
    "Yoga is not just about exercise, it’s a way of life. And\nthis life also includes eating a wholesome diet with\nsattvic foods.",
  ];

  List<String> ingredientNames = [
    "Name of Ingredient",
    "Name of Ingredient",
    "Name of Ingredient",
    "Name of Ingredient",
    "Name of Ingredient",
    "Name of Ingredient",
  ];

  List<String> foodPreparingListPoints = [
    "Wash the Little millet and soak it in water for at least 15-30 minutes.",
    "Press SAUTE, add oil, once hot, add in the mustard seeds, jeera and let them splutter.",
    "Then add hing, green chilies, ginger (optional), curry leaves, and saute for a few seconds.",
    "Then add onion. Saute for a minute or two till the onion turns slightly brown.",
    "Add chopped mixed vegetables, soaked millet, ¾ cup of water, salt, and mix well. Deglaze the pot, i.e., scrape any food particle that is sticking to the inner pot to avoid the BURN alert.",
    "Close the lid on the pot, and turn the pressure valve to the SEALING position.",
    "Set the pot to MANUAL/PRESSURE COOK (High Pressure) and set the timer to 4 minutes (If not soaking millets, set the timer to 6 minutes). When the instant pot beeps, do a Natural pressure release.",
    "Lastly, add grated coconut, coriander leaves, and lime juice and mix well.",
    "Serve Instant Pot Little Millet Upma with coconut chutney and chai.",
  ];

  List<String> foodPreparingListPointsNumbers = [
    "1. ", "2. ", "3. ", "4. ", "5. ", "6. ", "7. ", "8. ", "9. ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: displayWidth(context) * 0.09,),
            Row(
              children: [
                IconButton(
                  onPressed: (){
                     Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  iconSize: 15,
                  color: blackColor,
                ),
                commonText(
                    context: context,
                    text: "Sattvic Food",
                    fontWeight: FontWeight.w500,
                    textColor: blackColor,
                    textSize: displayWidth(context) * 0.04,
                    textAlign: TextAlign.start,
                    fontFamily: "Inter"),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: displayWidth(context) * 0.04,
                  right: displayWidth(context) * 0.04,
              ),
              child: Container(
               // width: displayWidth(context),
                height: displayWidth(context) * 0.59,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/images/sattvic_one.png") as ImageProvider,
                      height: displayWidth(context) * 0.7,
                      width: displayWidth(context),
                    ),
                    Positioned(
                        top: displayHeight(context) * 0.2,
                         left: displayWidth(context) * 0.23,
                        child:  sattvicFoodItems(context))
                  ],
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(right: displayHeight(context) * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                      context: context,
                      text: sattvicEnergyTitles[0],
                      fontWeight: FontWeight.w600,
                      textColor: blackColor,
                      textSize: displayWidth(context) * 0.04,
                      textAlign: TextAlign.start),

                  SizedBox(height: 5,),

                  commonText(
                      context: context,
                      text: sattvicEnergySubTitles[0],
                      fontWeight: FontWeight.w400,
                      textColor: Colors.black.withOpacity(0.6),
                      textSize: displayWidth(context) * 0.022,
                      textAlign: TextAlign.start),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: displayWidth(context) * 0.08,
                  right: displayWidth(context) * 0.08,
                  top: displayWidth(context) * 0.06),
              child: Container(
                width: displayWidth(context),
               // height: displayWidth(context) * 0.1,
                decoration: BoxDecoration(
                  color: Color(0xFFE3E1F1).withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(displayWidth(context) * 0.05))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.03,
                        top: displayWidth(context) * 0.04,
                      ),
                      child: commonText(
                          context: context,
                          text: "Ingredients",
                          fontWeight: FontWeight.w600,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.032,
                          textAlign: TextAlign.start),
                    ),

                    ingredients(context),

                    Padding(
                      padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.03,
                        top: displayWidth(context) * 0.01,
                      ),
                      child: commonText(
                          context: context,
                          text: "How to Make ",
                          fontWeight: FontWeight.w600,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.032,
                          textAlign: TextAlign.start),
                    ),

                    foodPreparingList(context),

                   SizedBox(height: displayWidth(context) * 0.03,),

                   Container(
                     height: displayWidth(context) * 0.4,
                     child: Stack(
                       children: [
                         Image(
                           image: AssetImage("assets/images/sattvic_one.png") as ImageProvider,
                           height: displayWidth(context) * 0.7,
                           width: displayWidth(context),
                         ),

                         Positioned(
                             top: displayHeight(context) * 0.07,
                             left: displayHeight(context) * 0.15,
                             child: IconButton(
                                 onPressed: (){},
                                 icon: Icon(Icons.play_circle_filled),
                               color: whiteColor,
                               iconSize: displayWidth(context) * 0.1,
                             ))
                       ],
                     ),
                   ),

                  ],
                ),
              ),
            ),

            SimilarRecipes(),

            SizedBox(height: displayWidth(context) * 0.06,),

            Padding(
              padding:  EdgeInsets.only(
                left: displayWidth(context) * 0.06,
                // right: displayWidth(context) * 0.06,
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(
                      context: context,
                      text: 'Popular Chefs',
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
            ),

            SizedBox(height: displayWidth(context) * 0.05,),

            PopularChefs(),

            GrandMomRecipesCard()
          ],
        ),
      ),
    );
  }

  Widget foodPreparingList(BuildContext context){
    return Padding(
      padding:  EdgeInsets.only(
        left: displayWidth(context) * 0.06,
      ),
      child: SizedBox(
       // height: displayWidth(context) * 0.37,
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: foodPreparingListPoints.length,
            itemBuilder: (context,index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                      context: context,
                      text: foodPreparingListPointsNumbers[index],
                      fontWeight: FontWeight.w500,
                      textColor: Colors.black.withOpacity(0.6),
                      textSize: displayWidth(context) * 0.027,
                      textAlign: TextAlign.start,fontFamily: "Inter"),
                  Container(
                    width: displayWidth(context) * 0.72,
                    child: commonText(
                        context: context,
                        text: foodPreparingListPoints[index],
                        fontWeight: FontWeight.w500,
                        textColor: Colors.black.withOpacity(0.6),
                        textSize: displayWidth(context) * 0.025,
                        textAlign: TextAlign.start,fontFamily: "Inter"),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }

  Widget ingredients(BuildContext context){
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 5.5),
      ),
      itemCount: ingredientNames.length,
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
              left: displayWidth(context) * 0.03,
              right: displayWidth(context) * 0.03,
              bottom: displayWidth(context) * 0.02,
            ),
            child: Container(
               width: displayWidth(context) * 0.04,
                //height: displayWidth(context) * 0.035,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(displayWidth(context) * 0.04)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonText(
                        context: context,
                        text: ingredientNames[index],
                        fontWeight: FontWeight.w600,
                        textColor: blackColor,
                        textSize: displayWidth(context) * 0.033,
                        textAlign: TextAlign.start,
                        fontFamily: "Inter"
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        left: displayWidth(context) * 0.03,
                        top: displayWidth(context) * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          commonText(
                              context: context,
                              text: "Qty 1 cub",
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black.withOpacity(0.6),
                              textSize: displayWidth(context) * 0.022,
                              textAlign: TextAlign.start,
                              fontFamily: "Inter"
                          ),

                          Container(
                            height: displayWidth(context) * 0.026,
                            child: VerticalDivider(
                              thickness: 1,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),

                          commonText(
                              context: context,
                              text: "20 Kcal",
                              fontWeight: FontWeight.w600,
                              textColor: Colors.black.withOpacity(0.6),
                              textSize: displayWidth(context) * 0.022,
                              textAlign: TextAlign.start,
                              fontFamily: "Inter"
                          ),
                        ],
                      ),
                    ),

                  ],
                )
            ),
          ),
        );
      },
    );
  }

  Widget sattvicFoodItems(BuildContext context){
    return Container(
      height: displayHeight(context) * 0.5,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          primary: false,
          itemCount: sattvicEnergyItems.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
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
                              textSize: displayWidth(context) * 0.023,
                              textAlign: TextAlign.start),

                          commonText(
                              context: context,
                              text: sattvicEnergyItemsQty[index],
                              fontWeight: FontWeight.w600,
                              textColor: whiteColor,
                              textSize: displayWidth(context) * 0.053,
                              textAlign: TextAlign.start),
                        ],
                      ),
                      index != sattvicEnergyItemsQty.length-1 ?  Container(
                        height: displayWidth(context) * 0.1,
                        child: VerticalDivider(
                          thickness: 1,
                          color: whiteColor,
                        ),
                      ) : Container()
                    ],
                  ),
                ),

              ],
            );
          }
      ),
    );
  }
}
