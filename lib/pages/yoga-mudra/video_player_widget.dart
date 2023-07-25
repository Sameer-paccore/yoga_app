// import 'package:better_player/better_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../custom_widgets/utils/common_size_helper.dart';
//
// class VideoPlayerWidget extends StatefulWidget {
//   const VideoPlayerWidget({Key? key}) : super(key: key);
//
//   @override
//   State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
// }
//
// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//
//   BetterPlayerConfiguration configuration = BetterPlayerConfiguration(
//
//     placeholderOnTop: false,
//     aspectRatio: 16 / 9,
//     fit: BoxFit.cover,
//     autoPlay: true,
//     looping: true,
//
//     controlsConfiguration: BetterPlayerControlsConfiguration(
//       enablePlayPause: true,
//       enableOverflowMenu: false,
//       skipBackIcon: Icons.fast_rewind,
//       skipForwardIcon: Icons.fast_forward,
//       playIcon: Icons.play_circle_filled,
//   ),
//
//     subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
//       fontSize: 20,
//       fontColor: Colors.white,
//       outlineColor: Colors.black,
//      // outlineWidth: 2,
//     ),
//   );
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     BetterPlayerController controller = BetterPlayerController(
//       configuration,
//       betterPlayerDataSource: BetterPlayerDataSource(
//         BetterPlayerDataSourceType.network,
//         "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//       ),
//     );
//     return Padding(
//       padding: EdgeInsets.only(
//           left: displayWidth(context) * 0.05,
//           right: displayWidth(context) * 0.05,
//           top: displayWidth(context) * 0.03
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(displayWidth(context) * 0.04),
//         child: BetterPlayer(controller: controller),
//       ),
//     );
//   }
// }


