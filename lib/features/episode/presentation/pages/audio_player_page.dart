// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:podcast_player_app/features/episode/presentation/bloc/episode_state.dart';
import 'package:podcast_player_app/features/episode/presentation/widget/audio_control_button.dart';
import 'package:podcast_player_app/features/episode/presentation/widget/audio_progress_bar.dart';

import '../../domain/entities/episode_entity.dart';
import '../bloc/episode_bloc.dart';
import '../bloc/episode_event.dart';

class AudioPlayerPage extends StatefulWidget {
  final String publisher;
  final String episodeId;
  const AudioPlayerPage({
    Key? key,
    required this.episodeId,
    required this.publisher,
  }) : super(key: key);

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  @override
  void initState() {
    context.read<EpisodeBloc>().add(FetchEpisode(episodeId: widget.episodeId));
    super.initState();
  }

  Widget _episodeImage(EpisodeEntity episode) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(episode.image),
    );
  }

  Widget _episodeInfo(EpisodeEntity episode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          episode.title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Text(
            widget.publisher,
            style: const TextStyle(color: Colors.orange, fontSize: 16.0),
          ),
        )
      ],
    );
  }

  Widget _controlPannel() {
    final bloc = context.read<EpisodeBloc>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: bloc.player.positionStream,
          builder: (context, position) {
            final totalDuration = bloc.player.duration ?? Duration.zero;
            final currentProgress = position.data ?? Duration.zero;
            return AudioProgressBar(
                currentProgress: currentProgress, totalDuration: totalDuration);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PlayerState>(
              stream: bloc.player.playerStateStream,
              builder: (context, snapshot) {
                final playerState = snapshot.data;
                final processingState = playerState?.processingState;
                final playing = playerState?.playing;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 64.0,
                    height: 64.0,
                    child: const CircularProgressIndicator(),
                  );
                } else if (playing != true) {
                  return AudioControlButton(
                    icon: CupertinoIcons.play_arrow_solid,
                    event: PlayAudio(),
                  );
                } else if (processingState != ProcessingState.completed) {
                  return AudioControlButton(
                    icon: CupertinoIcons.pause_fill,
                    event: PauseAudio(),
                  );
                } else {
                  return AudioControlButton(
                    icon: CupertinoIcons.refresh,
                    event: StopAudio(),
                  );
                }
              },
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Center(
        child: BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            if (state is FetchEpisodeLoading) {
              return const CircularProgressIndicator();
            } else if (state is FetchEpisodeSuccess) {
              final episode = state.episode;

              return Container(
                margin: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    _episodeImage(episode),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: _episodeInfo(episode),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: _controlPannel(),
                    ),
                  ],
                ),
              );
            } else if (state is FetchEpisodeFailed) {
              return Text("Error occured: ${state.messsage}");
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
