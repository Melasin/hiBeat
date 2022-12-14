import 'package:flutter/material.dart';

class PausePlayController extends StatelessWidget {
  const PausePlayController({
    Key? key,
    required this.playing,
    required this.onPause,
    required this.onPlay,
    this.height = 59,
    this.width = 59,
  }) : super(key: key);

  final bool playing;
  final double? height;
  final double? width;
  final Function() onPlay;
  final Function() onPause;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: FittedBox(child: playPauseButton(playing)),
    );
  }

  //* if media state is playing, this widgets icon and functon state
  //* changes as well
  FloatingActionButton playPauseButton(bool isplaying) => FloatingActionButton(
        elevation: 10,
        tooltip: 'Play',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: isplaying ? onPause : onPlay,
        backgroundColor: Colors.white,
        child: isplaying
            ? const Icon(
                Icons.pause_rounded,
                color: Colors.green,
                size: 35.0,
              )
            : const Icon(
                Icons.play_arrow_rounded,
                size: 35.0,
                color: Colors.green,
              ),
      );
}
