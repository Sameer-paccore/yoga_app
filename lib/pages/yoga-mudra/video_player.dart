import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../custom_widgets/utils/common_size_helper.dart';
import 'custom_orientation_controls.dart';
import 'data_manager.dart';
import 'mock_data.dart';

class VideoPlayerNew extends StatefulWidget {
  const VideoPlayerNew({Key? key}) : super(key: key);

  @override
  State<VideoPlayerNew> createState() => _VideoPlayerNewState();
}

class _VideoPlayerNewState extends State<VideoPlayerNew> {

  late FlickManager flickManager;
  late DataManager dataManager;
  List<String> urls = (mockData["items"] as List)
      .map<String>((item) => item["trailer_url"])
      .toList();

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
          urls[0],
        ),
        onVideoEnd: () {
          dataManager.skipToNextVideo(Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, urls: urls);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String url) {
    flickManager.handleChangeVideo(VideoPlayerController.network(url));
  }

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context)
        .loadString('images/bumble_bee_captions.srt');
    flickManager.flickControlManager!.toggleSubtitle();
    return SubRipCaptionFile(fileContents);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: displayWidth(context) * 0.03,
        right: displayWidth(context) * 0.03,
        top: displayWidth(context) * 0.07,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: VisibilityDetector(
          key: ObjectKey(flickManager),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 0 && this.mounted) {
              flickManager.flickControlManager?.autoPause();
            } else if (visibility.visibleFraction == 1) {
              flickManager.flickControlManager?.autoResume();
            }
          },
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: displayHeight(context) * 0.2,
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: CustomOrientationControls(dataManager: dataManager),
                  ),
                  flickVideoWithControlsFullscreen: FlickVideoWithControls(
                    controls: FlickLandscapeControls(
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
