import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:podcast_player_app/features/podcast/presentation/widget/episode_list_tile.dart';
import '../../domain/entities/podcast_entity.dart';
import '../bloc/podcast_bloc.dart';
import '../bloc/podcast_state.dart';

class PodcastEpisodesPage extends StatelessWidget {
  const PodcastEpisodesPage({super.key});

  Widget _header(PodcastEntity podcast) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.network(podcast.image)),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            podcast.title,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            podcast.publisher,
            style: const TextStyle(color: Colors.orange),
          ),
        )
      ],
    );
  }

  Widget _episodes(BuildContext context, PodcastEntity podcast) {
    final episodes = podcast.episodes;

    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${podcast.episodes.length} Episodes",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: episodes.length,
            itemBuilder: (_, index) {
              return EpisodeListTile(
                episodes: episodes[index],
                publisher: podcast.publisher,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<PodcastBloc, PodcastState>(
          builder: (context, state) {
            if (state is PodcastLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PodcastLoaded) {
              PodcastEntity podcast = state.podcastEntity;
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _header(podcast),
                      _episodes(context, podcast),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
