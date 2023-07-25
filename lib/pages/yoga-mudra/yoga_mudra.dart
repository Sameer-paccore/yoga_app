

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yoga_app/pages/yoga-mudra/video_player.dart';
import 'package:yoga_app/pages/yoga-mudra/video_player_widget.dart';

import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_widgets.dart';

class YogaMudra extends StatefulWidget {
  const YogaMudra({Key? key}) : super(key: key);

  @override
  State<YogaMudra> createState() => _YogaMudraState();
}

class _YogaMudraState extends State<YogaMudra> {

  List<String> yogaMudhrasImages = [
    "assets/images/yoga_mudra_one.png",
    "assets/images/yoga_mudra_two.png",
    "assets/images/yoga-mudra_three.png",
    "assets/images/yoga_mudra-four.png",
    "assets/images/yoga_mudra_five.png",
    "assets/images/yoga_mudra_six.png",
  ];

  List<String> mostPlayedTitles = [
    "By the lake",
    "Mantras",
    "Lo-Fi",
    "Fall into peace",
    "Fall into peace",
    "Fall into peace",
  ];

  List<String> mostPlayedSubTitles = [
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: displayWidth(context) * 0.09,),
            Row(
              children: [
                IconButton(
                  onPressed: (){
                     Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  iconSize: 15,
                  color: blackColor,
                ),
                commonText(
                    context: context,
                    text: "Yoga Mudhras",
                    fontWeight: FontWeight.w500,
                    textColor: blackColor,
                    textSize: displayWidth(context) * 0.04,
                    textAlign: TextAlign.start,
                    fontFamily: "Inter"),
              ],
            ),

            VideoPlayerNew(),

            Padding(
              padding:  EdgeInsets.only(
                left: displayWidth(context) * 0.1,
                right: displayWidth(context) * 0.1,
                top: displayWidth(context) * 0.06,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: yogaMudhrasImages.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.only(bottom: displayWidth(context) * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(
                                yogaMudhrasImages[index]) as ImageProvider,
                            width: displayWidth(context) * 0.13,
                            height: displayWidth(context) * 0.14,
                          ),

                          Padding(
                            padding:  EdgeInsets.only(
                                left: displayWidth(context) * 0.02
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText(
                                    context: context,
                                    text: mostPlayedTitles[index],
                                    fontWeight: FontWeight.w600,
                                    textColor: blackColor,
                                    textSize: displayWidth(context) * 0.038,
                                    textAlign: TextAlign.start,
                                    fontFamily: "Inter"
                                ),

                                commonText(
                                    context: context,
                                    text: mostPlayedSubTitles[index],
                                    //fontWeight: FontWeight.w100,
                                    textColor: blackColor,
                                    textSize: displayWidth(context) * 0.023,
                                    textAlign: TextAlign.start,
                                    fontFamily: "Inter"),

                                commonText(
                                    context: context,
                                    text: "15 Mins",
                                    fontWeight: FontWeight.w100,
                                    textColor: playBtnColor,
                                    textSize: displayWidth(context) * 0.018,
                                    textAlign: TextAlign.start,
                                    fontFamily: "Inter")
                              ],
                            ),
                          ),

                          Padding(
                            padding:  EdgeInsets.only(
                                top: displayWidth(context) * 0.032,
                                left: displayWidth(context) * 0.17
                            ),
                            child: Icon(
                              Icons.play_circle_filled,
                              color: playBtnColor,
                              size: displayWidth(context) * 0.043,
                            ),
                          ),

                        ],
                      ),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

 /* class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final _meeduPlayerController = MeeduPlayerController(
    controlsStyle: ControlsStyle.primary,
  );

  @override
  void initState() {
    super.initState();
// The following line will enable the Android and iOS wakelock.
    Wakelock.enable();

    // Wait until the fisrt render the avoid posible errors when use an context while the view is rendering
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  void dispose() {
    // The next line disables the wakelock again.
    Wakelock.disable();
    _meeduPlayerController.dispose();// release the video player
    super.dispose();
  }

  /// play a video from network
  _init() {
    _meeduPlayerController.setDataSource(
      DataSource(
        type: DataSourceType.network,
        source: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      ),
      autoplay: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.05,
        top: displayWidth(context) * 0.03
      ),
    child: VideoPlayerWidget(),
    /*  child: Container(
        height: displayWidth(context) * 0.53,
        width: displayWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: MeeduVideoPlayer(
            controller: _meeduPlayerController,
          ),
        ),
      ), */
    );
  }
} */
