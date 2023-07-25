import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yoga_app/custom_widgets/utils/colors.dart';
import 'package:yoga_app/pages/meditation/timer_plugin_code.dart';

import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_buttons.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class SetTimer extends StatefulWidget {
  const SetTimer({Key? key}) : super(key: key);

  @override
  State<SetTimer> createState() => _SetTimerState();
}

class _SetTimerState extends State<SetTimer> {

  DateTime? dateTime = DateTime.now();

  List<String> timerTypes = [
    "Hours",
    "Minutes",
    "Seconds",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
          iconSize: 20,
          color: blackColor,
        ),
        title: commonText(
            context: context,
            text: "Timer",
            fontWeight: FontWeight.w400,
            textColor: blackColor,
            textSize: displayWidth(context) * 0.05,
            textAlign: TextAlign.start,
            fontFamily: "Inter"
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: displayWidth(context) * 0.08,),

          Container(
            height: displayWidth(context) * 0.077,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: timerTypes.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context,index){
                  return Padding(
                    padding:  EdgeInsets.only(
                      left: displayWidth(context) * 0.03,
                      // right: displayWidth(context) * 0.03
                    ),
                    child: Container(
                       width: displayWidth(context) * 0.25,
                      height: displayWidth(context) * 0.11,
                      decoration: BoxDecoration(
                          color: yogaTabColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(
                              left: displayWidth(context) * 0.03,
                              right: displayWidth(context) * 0.03
                          ),
                          child: commonText(
                              context: context,
                              text: timerTypes[index],
                              fontWeight: FontWeight.w400,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.03,
                              textAlign: TextAlign.start),
                        ),
                      ),
                    ),
                  );
                }),
          ),

          SizedBox(height: displayHeight(context) * 0.1,),

          timer(),

          SizedBox(height: displayWidth(context) * 0.13,),

          Container(
            height: displayWidth(context) * 0.38,
            width: displayWidth(context) * 0.38,
            decoration: BoxDecoration(
              color: floatingBtnColor,
              borderRadius: BorderRadius.all(Radius.circular(displayWidth(context) * 0.4))
            ),
            child: Center(
              child: commonText(
                  context: context,
                  text: DateFormat('HH:mm:ss').format(dateTime!),
                  fontWeight: FontWeight.w400,
                  textColor: whiteColor,
                  textSize: displayWidth(context) * 0.06,
                  textAlign: TextAlign.start,
                  fontFamily: "Inter"
              ),
            ),
          ),

          SizedBox(height: displayWidth(context) * 0.14,),

          CommonButtons.getActionButton(
              title: 'Start',
              context: context,
              fontSize: displayWidth(context) * 0.042,
              textColor: Colors.white,
              buttonPrimaryColor: floatingBtnColor,
              borderColor: Colors.transparent,
              width: displayWidth(context) * 0.8,
              onTap: (){
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => SetTimer()));
              }
          ),
        ],
      ),
    );
  }

  Widget timer() {
    return  TimePickerSpinner(
      isShowSeconds: true,
      is24HourMode: true,
      normalTextStyle: TextStyle(
          fontSize: displayWidth(context) * 0.1,
          color: Colors.black.withOpacity(0.5)
      ),
      highlightedTextStyle: TextStyle(
          fontSize: displayWidth(context) * 0.1,
          color: blackColor
      ),
      spacing: 10,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          dateTime = time;
        });
      },
    );
  }
}
