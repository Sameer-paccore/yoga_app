

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';
import 'package:yoga_app/pages/authentication/sign_in.dart';

import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_buttons.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  TextEditingController _fieldOne = TextEditingController();
  String? otp = "";
  bool? isResendBtnClick = false;

  Timer? timer;

  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
  int currentSeconds = 0;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: AssetImage("assets/images/top_curve.png") as ImageProvider,
                  // height: 350,
                  width: displayWidth(context),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: displayHeight(context) * 0.65),
                  child: Image(
                    image: AssetImage("assets/images/bottom_curve.png") as ImageProvider,
                    // height: 350,
                    width: displayWidth(context),
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: displayHeight(context) * 0.15),
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: displayWidth(context) * 0.23,
                        height: displayWidth(context) * 0.23,
                        decoration: BoxDecoration(
                            color: blackColor,
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(displayWidth(context) * 0.07))
                        ),
                        child: Center(
                          child: commonText(
                              context: context,
                              text: 'App logo',
                              fontWeight: FontWeight.w500,
                              textColor: whiteColor,
                              textSize: displayWidth(context) * 0.045,
                              textAlign: TextAlign.center,
                              fontFamily: "Inter"
                          ),
                        ),
                      ),

                      SizedBox(
                        height: displayHeight(context) * 0.09,
                      ),

                      commonText(
                          context: context,
                          text: 'Verify OTP',
                          fontWeight: FontWeight.w600,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.092,
                          textAlign: TextAlign.center,
                          fontFamily: "Inter"
                      ),

                      SizedBox(
                        height: displayWidth(context) * 0.03,
                      ),
                      commonText(
                          context: context,
                          text: 'A verification OTP has been sent to you',
                          fontWeight: FontWeight.w400,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.03,
                          textAlign: TextAlign.start,
                        fontFamily: "Inter"
                      ),

                     // SizedBox(height: displayWidth(context) * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(
                              context: context,
                              text: ' +91 7993609722',
                              fontWeight: FontWeight.w600,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.03,
                              textAlign: TextAlign.start,
                            fontFamily: "Inter"
                          ),

                          GestureDetector(
                            onTap: (){

                            },
                            child: commonText(
                                context: context,
                                text: ' edit',
                                fontWeight: FontWeight.w600,
                                textColor: editColor,
                                textSize: displayWidth(context) * 0.03,
                                textAlign: TextAlign.start,
                              fontFamily: "Inter"
                            ),
                          ),


                        ],
                      ),

                      SizedBox(
                        height: displayWidth(context) * 0.1,
                      ),

                      Container(
                        width: displayWidth(context) * 0.5,
                        color: Colors.transparent,
                        child: PinCodeTextField(
                          controller: _fieldOne,
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: true,
                          obscuringCharacter: '*',
                          animationType:
                          AnimationType.fade,
                          hintCharacter: "*",
                          errorTextMargin: EdgeInsets.only(top: 20),
                          validator: (v) {
                            // if (v!.length < 4) {
                            //   return "Enter Valid OTP";
                            // } else {
                            //   return null;
                            // }
                          },
                          pinTheme: PinTheme(

                            inactiveColor: Colors.grey,
                            activeColor: Colors.green,
                            shape: PinCodeFieldShape.box,
                            borderWidth: 1,
                            fieldHeight: displayWidth(context) * 0.12,
                            fieldWidth: displayWidth(context) * 0.1,

                            borderRadius: BorderRadius.circular(10),
                            activeFillColor: Colors.green,
                            inactiveFillColor: Colors.pink,
                            selectedFillColor: Colors.grey[300],
                            selectedColor: Colors.blue,
                          ),
                          cursorColor: Colors.grey,
                          animationDuration: Duration(
                              milliseconds: 300),
                          textStyle: TextStyle(
                              fontSize: 14,
                              height: 1.6),
                          backgroundColor: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.transparent,

                          /*errorAnimationController:
                            signUpScreenBloc
                              .errorController,*/

                          keyboardType:
                          TextInputType.number,

                          onCompleted: (v) {
                            print("Completed");
                          },
                          // onTap: () {
                          //   print("Pressed");
                          // },
                          onChanged: (value) {
                            print(value);

                            setState(() {
                              otp = value;
                            });

                          },
                          beforeTextPaste: (text) {
                            print(
                                "Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            top: displayWidth(context) * 0.02,
                            bottom: 0,
                            left: displayWidth(context) * 0.02,
                            right: displayWidth(context) * 0.02),
                        child: isResendBtnClick!
                            ? CircularProgressIndicator(
                          color: floatingBtnColor,
                        )
                            :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            commonText(
                                context: context,
                                text: 'Resend otp in:',
                                fontWeight: FontWeight.w400,
                                textColor: timerText != null &&
                                    timerText == "00:00" ? blackColor : blackColor,
                                textSize: displayWidth(context) * 0.035,
                                textAlign: TextAlign.start),

                            commonText(
                                context: context,
                                text: ' 00:00',
                                fontWeight: FontWeight.w400,
                                textColor: editColor,
                                textSize: displayWidth(context) * 0.035,
                                textAlign: TextAlign.start),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: displayWidth(context) * 0.35,
                      ),

                      CommonButtons.getActionButton(
                          title: 'Verify',
                          context: context,
                          fontSize: displayWidth(context) * 0.042,
                          textColor: Colors.white,
                          buttonPrimaryColor: floatingBtnColor,
                          borderColor: Colors.transparent,
                          width: displayWidth(context) * 0.8,
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          }
                      ),

                      SizedBox(
                        height: displayWidth(context) * 0.04,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(
                              context: context,
                              text: 'Already Member?',
                              fontWeight: FontWeight.w400,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.035,
                              textAlign: TextAlign.start),

                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: commonText(
                                context: context,
                                text: 'Sign In',
                                fontWeight: FontWeight.w600,
                                textColor: floatingBtnColor,
                                textSize: displayWidth(context) * 0.035,
                                textAlign: TextAlign.start),)
                        ],
                      )
                    ],
                  ),
                )

                // Positioned(
                //   top: displayWidth(context) * 0.18,
                //   child: Image(
                //     image: AssetImage("assets/images/bottom_curve.png") as ImageProvider,
                //     // height: 350,
                //     width: displayWidth(context),
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
