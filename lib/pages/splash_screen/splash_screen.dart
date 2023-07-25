

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/custom_widgets/utils/common_size_helper.dart';
import 'package:yoga_app/custom_widgets/widgets/common_buttons.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import '../authentication/sign_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.18,
            ),
            Stack(
              children: [
                Image(
                    image: AssetImage("assets/images/splash_image.png") as ImageProvider,
                  width: displayHeight(context) * 0.55,
                  height: displayHeight(context) * 0.4,
                )
              ],
            ),

            Container(
              width: displayHeight(context) * 0.41,
              child: commonText(
                  context: context,
                  text: 'Shape your body and stay healthy',
                  fontWeight: FontWeight.w600,
                  textColor: blackColor,
                  textSize: displayWidth(context) * 0.083,
                  textAlign: TextAlign.center,
                fontFamily: "Outfit"
              ),
            ),
            SizedBox(
              height: displayWidth(context) * 0.05,
            ),

            Container(
              width: displayHeight(context) * 0.35,
              child: commonText(
                  context: context,
                  text: 'Yoga is a very healthy practice that has brought unbelievable results in the lives of people who have inculcated this in their daily routine.',
                  fontWeight: FontWeight.w300,
                  textColor: Colors.black.withOpacity(0.8),
                  textSize: displayWidth(context) * 0.03,
                  textAlign: TextAlign.center,
                fontFamily: "Outfit"
              ),
            ),

            SizedBox(
              height: displayWidth(context) * 0.1,
            ),

            CommonButtons.getActionButton(
              title: 'Get Started',
              context: context,
              fontSize: displayWidth(context) * 0.042,
              textColor: Colors.white,
              buttonPrimaryColor: floatingBtnColor,
              borderColor: Colors.transparent,
              width: displayWidth(context) * 0.75,
              fontFamily: "Outfit",
              onTap: (){
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) =>
                 SignUp()
               ));
              }
            )
          ],
        ),
      ),
    );
  }
}
