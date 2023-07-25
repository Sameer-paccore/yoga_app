import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../custom_widgets/custom_appbar.dart';
import '../../custom_widgets/utils/colors.dart';
import '../../custom_widgets/utils/common_size_helper.dart';
import '../../custom_widgets/widgets/common_text_search_field.dart';
import '../../custom_widgets/widgets/common_widgets.dart';
import '../meditation/audio_video_progress_bar_plugin_code.dart';

  PageManager? _pageManager;

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();


  List<String> mostPlayedImages = [
    "assets/images/by_the_lake.png",
    "assets/images/mantras.png",
    "assets/images/lo_fi.png",
    "assets/images/fall_into_peace.png",
  ];

  List<String> mostPlayedTitles = [
    "By the lake",
    "Mantras",
    "Lo-Fi",
    "Fall into peace",
  ];

  List<String> mostPlayedSubTitles = [
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
    "Created or Qurated by artist name",
  ];

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: musicBackColor,
        isCalledFrom: true,
        title:  Padding(
          padding:  EdgeInsets.only(
            left: displayWidth(context) * 0.02
          ),
          child: Container(
            width: displayWidth(context) * 0.25,
            height: displayWidth(context) * 0.08,
            decoration: BoxDecoration(
                color: blackColor,
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Center(
              child: commonText(
                  context: context,
                  text: 'App logo',
                  fontWeight: FontWeight.w500,
                  textColor: whiteColor,
                  textSize: displayWidth(context) * 0.042,
                  textAlign: TextAlign.start),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRect(
                  child: FractionalTranslation(
                    translation: Offset(0, -0.3),
                    child: Image(
                      image: AssetImage("assets/images/music_player_image.png") as ImageProvider,
                      // height: displayWidth(context) * 0.5,
                      width: displayWidth(context),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(
                        left: displayWidth(context) * 0.08,
                        right: displayWidth(context) * 0.08,
                        top: displayWidth(context) * 0.02,
                      ),
                      child: Row(
                        children: [
                          commonText(
                              context: context,
                              text: 'Welcome back ',
                              fontWeight: FontWeight.w500,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.035,
                              textAlign: TextAlign.start,
                              fontFamily: "Inter"
                          ),

                          commonText(
                              context: context,
                              text: 'Username',
                              fontWeight: FontWeight.w500,
                              textColor: blackColor,
                              textSize: displayWidth(context) * 0.04,
                              textAlign: TextAlign.start,
                              fontFamily: "Inter"),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: displayWidth(context) * 0.015,
                    ),

                    SizedBox(
                      height: displayWidth(context) * 0.02,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: displayWidth(context) * 0.08,right: displayWidth(context) * 0.08),
                      child: SearchTextField(
                          'Search',
                          searchController,
                          searchFocusNode,
                          false,
                          false, (value) {
                        if (value.length > 3) {
                          // future = commonProvider.getSearchData(
                          //     value, context, scaffoldKey);
                        }
                      }, (value) {
                        /*if (value.length > 3) {
                          future = commonProvider.getSearchData(
                              value, context, scaffoldKey);
                        }*/
                      }, TextInputType.text,
                          textInputAction: TextInputAction.search,
                          enabled: true,
                          isForTwoDecimal: false),
                    ),

                    SizedBox(height: displayWidth(context) * 0.04,),

                    Container(
                      width: displayHeight(context) * 0.32,
                      child: Image(
                            image: AssetImage("assets/images/banner_image.png") as ImageProvider,
                             //height: displayWidth(context) * 1,
                            //width: displayWidth(context) * 0.6,
                            fit: BoxFit.cover,
                          ),
                    ),

                    SizedBox(height: displayWidth(context) * 0.01,),

                    commonText(
                        context: context,
                        text: 'Floral Sunset',
                        fontWeight: FontWeight.w700,
                        textColor: blackColor,
                        textSize: displayWidth(context) * 0.04,
                        textAlign: TextAlign.start,
                        fontFamily: "Inter"),

                    SizedBox(height: displayWidth(context) * 0.01,),

                    commonText(
                        context: context,
                        text: 'Created or Qurated by artist name',
                       // fontWeight: FontWeight.w400,
                        textColor: Colors.black.withOpacity(0.6),
                        textSize: displayWidth(context) * 0.024,
                        textAlign: TextAlign.start,
                        fontFamily: "Inter"),

                    SizedBox(
                      height: displayWidth(context) * 0.01,
                    ),

                    AudioControlButtons(),
                    AudioProgressBar(),

                    Padding(
                      padding:  EdgeInsets.only(
                        left: displayWidth(context) * 0.136,
                        right: displayWidth(context) * 0.136,
                        top: displayWidth(context) * 0.06,
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: mostPlayedImages.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: EdgeInsets.only(bottom: displayWidth(context) * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        mostPlayedImages[index]) as ImageProvider,
                                    width: displayWidth(context) * 0.13,
                                    height: displayWidth(context) * 0.12,
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
                                            textSize: displayWidth(context) * 0.036,
                                            textAlign: TextAlign.start,
                                            fontFamily: "Inter"
                                        ),

                                        commonText(
                                            context: context,
                                            text: mostPlayedSubTitles[index],
                                            //fontWeight: FontWeight.w100,
                                            textColor: blackColor,
                                            textSize: displayWidth(context) * 0.02,
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
                )

                // Positioned(
                //  // top: displayWidth(context) * 0.09,
                //     child: Image(
                //       image: AssetImage("assets/images/banner_image.png") as ImageProvider,
                //        height: displayWidth(context) * 1,
                //       width: displayWidth(context) * 0.6,
                //       fit: BoxFit.cover,
                //     ),
                // )

              ],
            )
          ],
        ),
      ),
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _pageManager!.progressNotifier,
      builder: (_, value, __) {
        return Padding(
          padding: EdgeInsets.only(
              left: displayWidth(context) * 0.1,
              right: displayWidth(context) * 0.1,
          ),
          child: ProgressBar(
            timeLabelLocation: TimeLabelLocation.below,
            progress: value.current,
            buffered: value.buffered,
            total: value.total,
            onSeek: _pageManager!.seek,
          ),
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayWidth(context) * 0.14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
        ],
      ),
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager!.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(onPressed: (isFirst) ? null : _pageManager!.onPreviousSongButtonPressed,
            icon: Icon(Icons.fast_rewind),
          color: bottomAppColor,
          iconSize: displayWidth(context) * 0.08,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: _pageManager!.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return  IconButton(
              onPressed: _pageManager!.play,
              icon: Icon(Icons.play_circle_filled_sharp),
              color: bottomAppColor,
              iconSize: displayWidth(context) * 0.08,
            );
          case ButtonState.playing:
            return IconButton(
              icon: Icon(Icons.pause),
              color: bottomAppColor,
              iconSize: displayWidth(context) * 0.08,
              onPressed: _pageManager!.pause,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager!.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          onPressed: (isLast) ? null : _pageManager!.onNextSongButtonPressed,
          icon: Icon(Icons.fast_forward),
          color: bottomAppColor,
          iconSize: displayWidth(context) * 0.08,
        );
      },
    );
  }
}

class PageManager {
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;

  PageManager() {
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    _setInitialPlaylist();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
  }

  void _setInitialPlaylist() async {
    const prefix = 'https://www.soundhelix.com/examples/mp3';
    final song1 = Uri.parse('$prefix/SoundHelix-Song-1.mp3');
    final song2 = Uri.parse('$prefix/SoundHelix-Song-2.mp3');
    final song3 = Uri.parse('$prefix/SoundHelix-Song-3.mp3');
    _playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(song1, tag: 'Song 1'),
      AudioSource.uri(song2, tag: 'Song 2'),
      AudioSource.uri(song3, tag: 'Song 3'),
    ]);
    await _audioPlayer.setAudioSource(_playlist);
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;

      // update current song title
      final currentItem = sequenceState.currentSource;
      final title = currentItem?.tag as String?;
      currentSongTitleNotifier.value = title ?? '';

      // update playlist
      final playlist = sequenceState.effectiveSequence;
      final titles = playlist.map((item) => item.tag as String).toList();
      playlistNotifier.value = titles;

      // update shuffle mode
      isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;

      // update previous and next buttons
      if (playlist.isEmpty || currentItem == null) {
        isFirstSongNotifier.value = true;
        isLastSongNotifier.value = true;
      } else {
        isFirstSongNotifier.value = playlist.first == currentItem;
        isLastSongNotifier.value = playlist.last == currentItem;
      }
    });
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void onRepeatButtonPressed() {
    repeatButtonNotifier.nextState();
    switch (repeatButtonNotifier.value) {
      case RepeatState.off:
        _audioPlayer.setLoopMode(LoopMode.off);
        break;
      case RepeatState.repeatSong:
        _audioPlayer.setLoopMode(LoopMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioPlayer.setLoopMode(LoopMode.all);
    }
  }

  void onPreviousSongButtonPressed() {
    _audioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    _audioPlayer.seekToNext();
  }

  void onShuffleButtonPressed() async {
    final enable = !_audioPlayer.shuffleModeEnabled;
    if (enable) {
      await _audioPlayer.shuffle();
    }
    await _audioPlayer.setShuffleModeEnabled(enable);
  }

  void addSong() {
    final songNumber = _playlist.length + 1;
    const prefix = 'https://www.soundhelix.com/examples/mp3';
    final song = Uri.parse('$prefix/SoundHelix-Song-$songNumber.mp3');
    _playlist.add(AudioSource.uri(song, tag: 'Song $songNumber'));
  }

  void removeSong() {
    final index = _playlist.length - 1;
    if (index < 0) return;
    _playlist.removeAt(index);
  }
}


class ProgressNotifier extends ValueNotifier<ProgressBarState> {
  ProgressNotifier() : super(_initialValue);
  static const _initialValue = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );

}

class ProgressBarState {
  const ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

class RepeatButtonNotifier extends ValueNotifier<RepeatState> {
  RepeatButtonNotifier() : super(_initialValue);
  static const _initialValue = RepeatState.off;

  void nextState() {
    final next = (value.index + 1) % RepeatState.values.length;
    value = RepeatState.values[next];
  }
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}

class PlayButtonNotifier extends ValueNotifier<ButtonState> {
  PlayButtonNotifier() : super(_initialValue);
  static const _initialValue = ButtonState.paused;
}

enum ButtonState { paused, playing, loading, }