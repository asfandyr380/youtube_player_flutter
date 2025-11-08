import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SingleVideoPage extends StatefulWidget {
  const SingleVideoPage({super.key});

  @override
  State<SingleVideoPage> createState() => _SingleVideoPageState();
}

class _SingleVideoPageState extends State<SingleVideoPage> {
  late YoutubePlayerController _youtubeController;

  final List<String> _videoIds = [
    'bmgia-h1qNg',
    'Cohbiz2lOQI',
    'CoNgsfBbxJk',
    'c9gzcPkSdw0',
    'UEA_uwpvqtI',
    'j61j9X4xCnA',
  ];

  @override
  void initState() {
    super.initState();
    const String origin = "https://www.youtube-nocookie.com";
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: _videoIds[1],
      autoPlay: true,
      params: const YoutubePlayerParams(origin: origin),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _youtubeController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Single Video Page"),
      ),
      body: YoutubePlayerScaffold(
        controller: _youtubeController,
        aspectRatio: 16 / 9,
        autoFullScreen: false,
        enableFullScreenOnVerticalDrag: false,
        lockedOrientations: const [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
        defaultOrientations: const [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
        builder: (_, player) {
          return player;
        },
      ),
    );
  }
}
