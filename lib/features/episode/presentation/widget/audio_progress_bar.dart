import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/episode_bloc.dart';
import '../bloc/episode_event.dart';

class AudioProgressBar extends StatefulWidget {
  final Duration currentProgress;
  final Duration totalDuration;

  const AudioProgressBar({
    Key? key,
    required this.currentProgress,
    required this.totalDuration,
  }) : super(key: key);

  @override
  State<AudioProgressBar> createState() => _AudioProgressBarState();
}

class _AudioProgressBarState extends State<AudioProgressBar> {
  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      thumbColor: Colors.black87,
      baseBarColor: Colors.grey.shade200,
      progressBarColor: Colors.orange,
      progress: widget.currentProgress,
      total: widget.totalDuration,
      onSeek: (value) {
        context.read<EpisodeBloc>().add(
              SeekDuration(position: value),
            );
      },
    );
  }
}
