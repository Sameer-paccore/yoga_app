


//custom text widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonText(
    {String? text,
      BuildContext? context,
      double? textSize,
      Color? textColor,
      FontWeight? fontWeight,
      TextAlign? textAlign = TextAlign.center,
      TextDecoration textDecoration = TextDecoration.none,
      String? fontFamily
    }) {
  return Text(
    text ?? '',
    textAlign: textAlign!,
    style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        decoration: textDecoration),
    overflow: TextOverflow.clip,
    softWrap: true,
  );
}

Widget commonTextNew(
    {String? text,
      BuildContext? context,
      double? textSize,
      Color? textColor,
      FontWeight? fontWeight,
      TextAlign? textAlign = TextAlign.center,
      TextDecoration textDecoration = TextDecoration.none}) {
  return Text(
    text ?? '',
    textAlign: textAlign!,
    style: TextStyle(
        fontSize: textSize,
        color: textColor,
        fontFamily: "",
        fontWeight: fontWeight,
        decoration: textDecoration),
    overflow: TextOverflow.clip,
    softWrap: true,
    maxLines: 3,
  );


}


Widget commonTextDashboard(
    String text,
    BuildContext context,
    double textSize,
    Color textColor,
    FontWeight fontWeight,
    String? fontFamily,
    int? maxLines, [
      TextAlign? textAlign = TextAlign.center,
      TextDecoration textDecoration = TextDecoration.none,
    ]) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: textSize,
      color: textColor,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      decoration: textDecoration,
    ),
    overflow: TextOverflow.ellipsis,
    softWrap: true,
  );
}

commonCircleImage(
    BuildContext context, double size, Color primaryColor, String image) {
  return CircleAvatar(
      radius: size,
      backgroundColor: primaryColor.withOpacity(0.7),
      backgroundImage: NetworkImage(
        image,
      ));
}

