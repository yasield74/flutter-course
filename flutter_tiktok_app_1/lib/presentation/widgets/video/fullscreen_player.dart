import 'package:flutter/material.dart';
import 'package:flutter_tiktok_app_1/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreanPlayer extends StatefulWidget {
  const FullScreanPlayer(
      {super.key, required this.videoUrl, required this.caption});

  final videoUrl;
  final caption;

  @override
  State<FullScreanPlayer> createState() => _FullScreanPlayerState();
}

class _FullScreanPlayerState extends State<FullScreanPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              VideoPlayer(controller),
              VideoBackground(
                stops: const [0.8, 1.0],
              ),
              Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption))
            ]),
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  const _VideoCaption({super.key, required this.caption});

  final String caption;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final style = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: style,
      ),
    );
  }
}
