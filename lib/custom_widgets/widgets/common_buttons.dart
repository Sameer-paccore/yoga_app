

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/common_size_helper.dart';
import 'common_widgets.dart';

class CommonButtons{
  // Action button
  static Widget getActionButton(
      {String? title,
        BuildContext? context,
        Color? borderColor,
        Color? textColor,
        double? fontSize,
        Function()? onTap,
        double? width,
        Color? buttonPrimaryColor,
        String? fontFamily
      }) {
    width ??= displayWidth(context!);
    borderColor ??= buttonPrimaryColor;

    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonPrimaryColor),
            fixedSize: MaterialStateProperty.all(
                Size(width, displayHeight(context!) * 0.06)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(color: borderColor!),
                borderRadius: BorderRadius.circular(8.0)))),
        child: Center(
          child: commonText(
              text: title,
              context: context,
              textSize: fontSize,
              textColor: textColor,
              fontWeight: FontWeight.w500,
          fontFamily: fontFamily),
        ));
  }
}