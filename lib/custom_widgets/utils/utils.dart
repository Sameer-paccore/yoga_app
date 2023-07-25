
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Utils{
  static customPrint(String text) {
    // kReleaseMode ? null : debugPrint('$text');
    debugPrint('$text');
  }

  //To display snackbar
  static void showSnackBar(BuildContext context,
      {GlobalKey<ScaffoldState>? scaffoldKey,
        String? message,
        int duration = 3,
        bool status = true}) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    debugPrint("STATUS $status");

    final snackBar = SnackBar(
      backgroundColor: status ? Colors.blue : Colors.red,
      content: Row(
        children: [
          Icon(
            status ? Icons.offline_pin : Icons.info,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
                message!,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.white,
                ),
              )),
        ],
      ),
      duration: Duration(seconds: duration),
      behavior: SnackBarBehavior.floating,
    );
    // scaffoldKey?.currentState?.showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}