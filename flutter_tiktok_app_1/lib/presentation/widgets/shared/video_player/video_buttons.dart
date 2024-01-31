import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok_app_1/domain/entities/video_post.dart';
import 'package:flutter_tiktok_app_1/helpers/human_formats.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({super.key, required this.video});
  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          value: video.likes,
          iconColor: Colors.red,
          iconData: Icons.favorite,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 20,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        )
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  final int value;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            size: 30,
          ),
          color: color,
        ),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
