import 'package:flutter/material.dart';
import 'package:flutter_tiktok_app_1/domain/entities/video_post.dart';
import 'package:flutter_tiktok_app_1/presentation/widgets/shared/video_player/video_buttons.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            Positioned(
                bottom: 40, right: 20, child: VideoButton(video: videoPost))
          ],
        );
      },
    );
  }
}
