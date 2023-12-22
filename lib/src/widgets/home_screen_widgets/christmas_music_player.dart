import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';

class ChristmasMusicPlayer extends StatefulWidget {
  const ChristmasMusicPlayer({super.key});

  @override
  State<ChristmasMusicPlayer> createState() => _ChristmasMusicPlayerState();
}

class _ChristmasMusicPlayerState extends State<ChristmasMusicPlayer> {
  final player = AudioPlayer(playerId: '01');

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    player.audioCache = AudioCache(prefix: 'lib/assets/');
    player.setVolume(0.18);
    player.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.completed) {
        player.stop();
        setState(() {
          isPlaying = false;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (isPlaying) {
          player.stop();
          setState(() {
            isPlaying = false;
          });
        } else {
          player.play(AssetSource('audio/christmas_song.mp3'));
          setState(() {
            isPlaying = true;
          });
        }
      },
      icon: FaIcon(
        isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
        color: AppTheme.lightWhiteColor,
        size: 16,
      ),
    );
  }
}
