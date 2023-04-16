import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/episode_bloc.dart';
import '../bloc/episode_event.dart';

class AudioControlButton extends StatelessWidget {
  final IconData icon;
  final EpisodeEvent event;
  const AudioControlButton({
    required this.icon,
    required this.event,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EpisodeBloc>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            bloc.add(SeekBackward());
          },
          icon: const Icon(CupertinoIcons.backward_fill),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            onTap: () {
              bloc.add(event);
            },
          ),
        ),
        IconButton(
          onPressed: () {
            bloc.add(SeekForward());
          },
          icon: const Icon(CupertinoIcons.forward_fill),
        ),
      ],
    );
  }
}
