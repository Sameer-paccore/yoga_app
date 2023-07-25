import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';

import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import 'category_view.dart';

class CategoryFullView extends StatefulWidget {
  const CategoryFullView({Key? key}) : super(key: key);

  @override
  State<CategoryFullView> createState() => _CategoryFullViewState();
}

class _CategoryFullViewState extends State<CategoryFullView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: displayWidth(context) * 0.03,),
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
                        text: "Yoga",
                        fontWeight: FontWeight.w500,
                        textColor: blackColor,
                        textSize: displayWidth(context) * 0.04,
                        textAlign: TextAlign.start,
                    fontFamily: "Inter"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                      image: AssetImage("assets/images/yoga_main.png") as ImageProvider,
                    height: displayWidth(context) * 0.5,
                    width: displayWidth(context),
                  ),
                ),
                CategoryView()
              ],
            ),
          ),
        )
    );
  }
}
