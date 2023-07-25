
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yoga_app/pages/authentication/sign_up.dart';
import 'package:yoga_app/pages/dashboard/dashboard.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_buttons.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import '../dashboard/dashboard_main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  String initialCountryCode = 'US';
  String? countryCode;

  FocusNode mobileFocusNode = FocusNode();
   TextEditingController? mobileController;
  bool showErrorBorder = false;

  @override
  void initState() {
    super.initState();
    mobileController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                          text: 'Sign In',
                          fontWeight: FontWeight.w600,
                          textColor: blackColor,
                          textSize: displayWidth(context) * 0.092,
                          textAlign: TextAlign.center,
                          fontFamily: "Inter"
                      ),

                      Form(
                        key: signInFormKey,
                        child: Column(
                          children: [
                            //Mobile contoller
                            Padding(
                              padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.08,
                                  right: displayWidth(context) * 0.08,
                                  top: displayWidth(context) * 0.06),
                              child: Container(
                                height: displayWidth(context) * 0.19,
                                width: displayWidth(context) * 0.8,
                                decoration: BoxDecoration(
                                  //  color: textFieldBackgroundColor,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  // border: Border.all(
                                  //   color: showErrorBorder ? Colors.red : Colors.transparent,
                                  //   width: 1.0,
                                  // ),
                                ),
                                child: IntlPhoneField(
                                  autovalidateMode: AutovalidateMode.disabled,
                                  initialCountryCode: initialCountryCode,
                                  controller: mobileController,
                                  focusNode: mobileFocusNode,
                                  disableLengthCheck: false,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  flagsButtonPadding: EdgeInsets.only(left: 10),
                                  dropdownDecoration: BoxDecoration(),
                                  style: TextStyle(color: Colors.black),
                                  dropdownIconPosition: IconPosition.trailing,
                                  dropdownTextStyle: TextStyle(color: Colors.black),
                                  dropdownIcon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black,
                                  ),
                                  showCountryFlag: false,
                                  invalidNumberMessage: "Invalid Mobile Number",
                                  decoration: InputDecoration(
                                    fillColor: textFieldBackgroundColor,
                                    focusColor: textFieldBackgroundColor,
                                    filled: true,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
                                    labelText: 'Mobile Number',
                                    hintText: "Mobile Number",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : textFieldHintColor,
                                        fontSize: displayWidth(context) * 0.03,
                                        fontFamily: "Inter"),
                                    labelStyle: TextStyle(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? Colors.white
                                            : textFieldHintColor,
                                        fontSize: displayWidth(context) * 0.034,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500),
                                    errorText: showErrorBorder ? "Enter Mobile Number" : null,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1, color: Colors.transparent),
                                        borderRadius: BorderRadius.all(Radius.circular(15))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 1, color: Colors.transparent),
                                        borderRadius: BorderRadius.all(Radius.circular(15))),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                    errorStyle: TextStyle(
                                        fontFamily: "Inter",
                                        color: Colors.red,
                                        fontSize: displayWidth(context) * 0.025),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: Colors.red),
                                        borderRadius: BorderRadius.all(Radius.circular(8))),
                                  ),
                                  onChanged: (phone) {
                                    setState(() {
                                      showErrorBorder = false;
                                    });
                                    countryCode = phone.countryCode;
                                    print(phone.completeNumber);
                                  },
                                  validator: (value) {
                                    if (value!.toString().isEmpty) {
                                      // setState(() {
                                      //   showErrorBorder = true;
                                      // });
                                      return 'Invalid Mobile Number';
                                    }else{
                                      setState(() {
                                        showErrorBorder = false;
                                      });
                                    }
                                    return null;
                                  },
                                  onCountryChanged: (country) {
                                    print('Country changed to: ' + country.name);
                                  },
                                ),
                              ),
                            ),

                            SizedBox(
                              height: displayHeight(context) * 0.26,
                            ),

                            CommonButtons.getActionButton(
                                title: 'Sign In',
                                context: context,
                                fontSize: displayWidth(context) * 0.042,
                                textColor: Colors.white,
                                buttonPrimaryColor: floatingBtnColor,
                                borderColor: Colors.transparent,
                                width: displayWidth(context) * 0.8,
                                onTap: (){
                                  if(mobileController!.text.isNotEmpty){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DashboardMain()));
                                  } else{
                                    setState(() {
                                      showErrorBorder = true;
                                    });
                                  }
                                }
                            ),

                            SizedBox(
                              height: displayWidth(context) * 0.055,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                commonText(
                                    context: context,
                                    text: 'New User?',
                                    fontWeight: FontWeight.w400,
                                    textColor: blackColor,
                                    textSize: displayWidth(context) * 0.035,
                                    textAlign: TextAlign.start),

                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: commonText(
                                      context: context,
                                      text: 'Sign Up',
                                      fontWeight: FontWeight.w400,
                                      textColor: floatingBtnColor,
                                      textSize: displayWidth(context) * 0.035,
                                      textAlign: TextAlign.start),)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
