
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/custom_widgets/utils/common_size_helper.dart';

import '../../custom_widgets/utils/colors.dart';

class Emojis extends StatefulWidget {
  const Emojis({Key? key}) : super(key: key);

  @override
  State<Emojis> createState() => _EmojisState();
}

class _EmojisState extends State<Emojis> {

  int selectedIndex = 0;

  List<String> emojis = [
    "assets/images/emoji1.png",
    "assets/images/emoji2.png",
    "assets/images/emoji5.png",
    "assets/images/emoji4.png",
    "assets/images/emoji5.png",
    "assets/images/emoji6.png",
    "assets/images/emoji7.png",
    "assets/images/emoji8.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: displayWidth(context) * 0.2,
        //width: 400,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: emojis.length,
            itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.only(left: 4,right: 4),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: selectedIndex == index ? floatingBtnColor : emojiBackgroundColor,
                    radius: 17,
                   // backgroundImage: AssetImage(emojis[index]) as ImageProvider,
                    child: Image(
                        image: AssetImage(emojis[index]) as ImageProvider
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
