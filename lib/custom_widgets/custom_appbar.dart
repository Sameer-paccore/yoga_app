import 'package:flutter/material.dart';
import 'package:yoga_app/custom_widgets/utils/common_size_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Function()? onNotificationTap;
  final Function()? onshareTap;
  final bool? calledFromDashboard;
  final Color? buttonPrimaryColor;
  final Widget? title;
  final bool? boolean;
  final Color? backgroundColor;
  final bool isCalledFrom;
  const CustomAppBar(
      {Key? key,
        this.leading,
        this.onNotificationTap,
        this.onshareTap,
        this.calledFromDashboard,
        this.buttonPrimaryColor, this.title, this.boolean,this.backgroundColor,this.isCalledFrom = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return !isCalledFrom ? Padding(
      padding: EdgeInsets.only(
          left: displayWidth(context) * 0.04,
          right: displayWidth(context) * 0.04
      ),
      child: AppBar(
        toolbarHeight: displayHeight(context) * 0.1,
        automaticallyImplyLeading:boolean ?? false ,
        leading: leading,
        backgroundColor: backgroundColor,
        elevation: 0,
        title: title,
        actions: [
          IconButton(
            onPressed: onNotificationTap,
            icon: Image.asset(
              'assets/images/notification_icon.png',scale: 3.5,
              width: displayWidth(context) * 0.054,
              height: displayWidth(context) * 0.054,
            ),
          ),

          IconButton(
            onPressed: onshareTap,
            icon: Image.asset(
                'assets/images/share.png',scale: 3.5,
              width: displayWidth(context) * 0.065,
              height: displayWidth(context) * 0.065,
            ),
          ),
        ],
      ),
    ) : AppBar(
      toolbarHeight: displayHeight(context) * 0.1,
      automaticallyImplyLeading:boolean ?? false ,
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: 0,
      title: title,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: displayWidth(context) * 0.055),
          child: Row(
            children: [
              IconButton(
                onPressed: onNotificationTap,
                icon: Image.asset(
                  'assets/images/notification_icon.png',
                  scale: 3.5,
                  width: displayWidth(context) * 0.05,
                  height: displayWidth(context) * 0.05,
                ),
              ),

              IconButton(
                onPressed: onshareTap,
                icon: Image.asset('assets/images/share.png',scale: 3.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
