import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/episode/presentation/bloc/episode_bloc.dart';
import 'features/podcast/presentation/bloc/podcast_bloc.dart';
import 'features/podcast/presentation/bloc/podcast_event.dart';
import 'features/podcast/presentation/pages/podcast_episodes_page.dart';
import 'registered_injection.dart' as di;
import 'registered_injection.dart';

void main() {
  di.RegisteredInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PodcastBloc(useCase: sl())..add(FetchPodcast()),
        ),
        BlocProvider(
          create: (context) => EpisodeBloc(
            player: sl(),
            fetchEpisodeUseCase: sl(),
            playEpisodeAudioUseCase: sl(),
          ),
        ),
      ],
      child: MaterialApp(
          title: "Podcast Player App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const PodcastEpisodesPage()),
    );
  }
}
