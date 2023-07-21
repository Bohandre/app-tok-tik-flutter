import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tok_tik_app/config/helpers/human_formats.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';

class VideoButtons extends StatefulWidget {
  final VideoPost video;

  const VideoButtons({
    super.key,
    required this.video,
  });

  @override
  State<VideoButtons> createState() => _VideoButtonsState();
}

class _VideoButtonsState extends State<VideoButtons> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        _CustomIconButton(
          value: clickCounter,
          onPressed: () {
            setState(() {
              clickCounter++;
            });
          },
          iconColor: Colors.red.shade900,
          icon: Icons.favorite,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        _CustomIconButton(
          value: widget.video.views,
          icon: Icons.remove_red_eye_outlined,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButton(
            value: 0,
            icon: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int? value;
  final IconData icon;
  final Color? color;
  final Function()? onPressed;

  const _CustomIconButton({
    this.value,
    required this.icon,
    iconColor,
    this.onPressed,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size.width * 0.07,
          ),
        ),
        if (value! > 0)
          Text(HumanFormarts.humanReadbleNumber(value!.toDouble())),
      ],
    );
  }
}
