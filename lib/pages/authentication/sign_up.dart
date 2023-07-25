

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yoga_app/custom_widgets/utils/common_size_helper.dart';
import 'package:yoga_app/pages/authentication/sign_in.dart';
import 'package:yoga_app/pages/authentication/verification.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/utils.dart';
import '../../custom_widgets/widgets/common_buttons.dart';
import '../../custom_widgets/widgets/common_text_field.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController? nameController;
  TextEditingController? mobileController;
  TextEditingController? emailController;
  TextEditingController? ageController;

  FocusNode nameFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();

  String initialCountryCode = 'US';
  String? countryCode;
  bool isChecked = false;
  bool showErrorBorder = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: scaffoldKey,
      child: Scaffold(
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
                          height: displayHeight(context) * 0.08,
                        ),

                        commonText(
                            context: context,
                            text: 'Sign Up',
                            fontWeight: FontWeight.w600,
                            textColor: blackColor,
                            textSize: displayWidth(context) * 0.09,
                            textAlign: TextAlign.center,
                          fontFamily: "Inter"
                        ),

                        SizedBox(
                          height: displayWidth(context) * 0.03,
                        ),

                        Form(
                          key: signUpFormKey,
                            child: Container(
                              width: displayWidth(context),
                             // height: 600,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth(context) * 0.1,
                                        right: displayWidth(context) * 0.1,
                                        top: displayWidth(context) * 0.05),
                                    child: CommonTextField(
                                        controller: nameController,
                                        focusNode: nameFocusNode,
                                        labelText: 'Name',
                                        hintText: '',
                                        suffixText: null,
                                        isMultilineField: false,
                                        textInputAction: TextInputAction.next,
                                        textInputType: TextInputType.text,
                                        textCapitalization: TextCapitalization.words,
                                        maxLength: 32,
                                        prefixIcon: null,
                                        requestFocusNode: mobileFocusNode,
                                        obscureText: false,
                                        onTap: () {},
                                        onChanged: (String value) {},
                                        validator: (value) {
                                          if (value!.trim().isEmpty) {
                                            return 'Enter Name';
                                          }
                                          return null;
                                        },
                                        onSaved: (String value) {
                                          Utils.customPrint(value);
                                        }),
                                  ),

                                  //Mobile contoller
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth(context) * 0.08,
                                        right: displayWidth(context) * 0.08,
                                        top: displayWidth(context) * 0.03),
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
                                        textInputAction: TextInputAction.next,
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
                                        dropdownTextStyle: TextStyle(color: textFieldHintColor),
                                        dropdownIcon: Icon(
                                          Icons.arrow_drop_down,
                                          color: textFieldHintColor,
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

                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth(context) * 0.1,
                                        right: displayWidth(context) * 0.1,
                                       // top: displayWidth(context) * 0.018
                                    ),
                                    child: CommonTextField(
                                        controller: ageController,
                                        focusNode: ageFocusNode,
                                        labelText: 'Age',
                                        hintText: '',
                                        suffixText: null,
                                        isMultilineField: false,
                                        textInputAction: TextInputAction.next,
                                        textInputType: TextInputType.number,
                                        textCapitalization: TextCapitalization.words,
                                        maxLength: 3,
                                        prefixIcon: null,
                                        requestFocusNode: emailFocusNode,
                                        obscureText: false,
                                        onTap: () {},
                                        onChanged: (String value) {},
                                        validator: (value) {
                                          if (value!.trim().isEmpty) {
                                            return 'Enter your Age';
                                          }
                                          return null;
                                        },
                                        onSaved: (String value) {
                                          Utils.customPrint(value);
                                        }),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth(context) * 0.1,
                                        right: displayWidth(context) * 0.1,
                                        top: displayWidth(context) * 0.03),
                                    child: CommonTextField(
                                      // key: passwordFormFieldKey,
                                        controller: emailController,
                                        focusNode: emailFocusNode,
                                        labelText: 'Email',
                                        hintText: '',
                                        suffixText: null,
                                        isMultilineField: false,
                                        textInputAction: TextInputAction.done,
                                        textInputType: TextInputType.emailAddress,
                                        textCapitalization: TextCapitalization.words,
                                        maxLength: 32,
                                        prefixIcon: null,
                                        requestFocusNode: null,
                                        obscureText: false,
                                        onTap: () {},
                                        onFieldSubmitted: (value) {},
                                        onChanged: (String value) {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter Email';
                                          }
                                          if (!EmailValidator.validate(value)) {
                                            return 'Enter Valid Email';
                                          } else if (EmailValidator.validate(value)) {
                                            String emailExt = value.split('.').last;

                                            if (!['com', 'in', 'us'].contains(emailExt)) {
                                              return 'Enter valid email';
                                            }
                                          }
                                          return null;
                                        },
                                        onSaved: (String value) {
                                          Utils.customPrint(value);
                                        }),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: displayWidth(context) * 0.1,
                                        right: displayWidth(context) * 0.085,
                                        top: displayWidth(context) * 0.04),
                                    child: CircularRadioTile(
                                      isChecked: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = !isChecked;
                                        });},
                                      value: isChecked,
                                      title: RichText(
                                        text: TextSpan(
                                          text: 'By clicking on Sign Up you accept',
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            color: Colors.black.withOpacity(0.8),
                                            fontSize: displayWidth(context) * 0.03,
                                           // fontWeight: FontWeight.w100,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' T&C',
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () async {
                                                    // Navigator.of(context).push(
                                                    //     MaterialPageRoute(builder: (context) {
                                                    //       return TermsAndConditionsWebView();
                                                    //     }));
                                                  },
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    color: Color(0xFF42B5BF),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: displayWidth(context) * 0.032)),
                                            TextSpan(
                                                text: '\nand ',
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    color: Colors.black.withOpacity(0.8),
                                                    fontSize: displayWidth(context) * 0.03)),
                                            TextSpan(
                                                text: ' Privacy Policy',
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () async {
                                                    // Navigator.of(context).push(
                                                    //     MaterialPageRoute(builder: (context) {
                                                    //       return PrivacyAndPolicyWebView();
                                                    //     }));
                                                  },
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    color: Color(0xFF42B5BF),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: displayWidth(context) * 0.032)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: displayWidth(context) * 0.04,
                                  ),

                                  CommonButtons.getActionButton(
                                      title: 'Sign Up',
                                      context: context,
                                      fontSize: displayWidth(context) * 0.044,
                                      textColor: Colors.white,
                                      buttonPrimaryColor: floatingBtnColor,
                                      borderColor: Colors.transparent,
                                      width: displayWidth(context) * 0.8,
                                      onTap: (){
                                        if(signUpFormKey.currentState!.validate()){
                                          if(isChecked){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Verification()));
                                          } else{
                                            Utils.showSnackBar(context,
                                                scaffoldKey: scaffoldKey, message: "Please accept Terms and Conditions and Privacy Policy.");
                                          }

                                        } else{
                                          setState(() {
                                            showErrorBorder = true;
                                          });
                                        }
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
                                            fontWeight: FontWeight.w700,
                                            textColor: floatingBtnColor,
                                            textSize: displayWidth(context) * 0.035,
                                            textAlign: TextAlign.start),)
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),

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
      ),
    );
  }
}

class CircularRadioTile extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final Widget? title;
  final bool? isChecked;

  CircularRadioTile({
    this.value,
    this.onChanged,
    this.title,
    this.isChecked = false
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged!(!value!);
      },
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: isChecked! ? Colors.blue : Colors.transparent,
              border: Border.all(
                color: isChecked! ? Colors.transparent : Colors.black.withOpacity(0.6),
                width: 2,
              ),
            ),
            child: isChecked!
                ? Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            )
                : null,
          ),
          SizedBox(width: 16),
          Expanded(child: title!),
        ],
      ),
    );
  }
}
