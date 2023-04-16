import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../domain/usecase/fetch_episode_usecase.dart';
import '../../domain/usecase/play_episode_audio_usecase.dart';
import 'episode_event.dart';
import 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final AudioPlayer player;
  final FetchEpisodeUseCase fetchEpisodeUseCase;
  final PlayEpisodeAudioUseCase playEpisodeAudioUseCase;

  EpisodeBloc({
    required this.player,
    required this.fetchEpisodeUseCase,
    required this.playEpisodeAudioUseCase,
  }) : super(EpisodeInitial()) {
    on<FetchEpisode>(
      (event, emit) async {
        emit(FetchEpisodeLoading());
        final fetchEpisodeResult =
            await fetchEpisodeUseCase.build(event.episodeId);
        fetchEpisodeResult
            .fold((failure) => emit(FetchEpisodeFailed(failure.errorMessage)),
                (result) async {
          emit(FetchEpisodeSuccess(result));
          final fetchAudioResult =
              await playEpisodeAudioUseCase.build(result.audio);
          fetchAudioResult.fold(
              (failure) => emit(FetchEpisodeFailed(failure.errorMessage)),
              (r) => null);
        });
      },
    );

    on<PlayAudio>(
      (event, emit) async {
        await player.play();
      },
    );

    on<PauseAudio>(
      (event, emit) async {
        await player.pause();
      },
    );

    on<ResumeAudio>(
      (event, emit) async {
        await player.play();
      },
    );

    on<StopAudio>(
      (event, emit) async {
        await player.seek(Duration.zero);
        await player.stop();
      },
    );

    on<SeekDuration>((event, emit) async => await player.seek(event.position));

    on<SeekForward>((event, emit) async {
      final seekForward = player.position + const Duration(seconds: 10);
      await player.seek(seekForward);
    });

    on<SeekBackward>((event, emit) async {
      final seekBackward = player.position - const Duration(seconds: 10);
      await player.seek(seekBackward);
    });

    on<Dispose>((event, emit) => (event, emit) {
          player.dispose();
        });
  }

  @override
  Future<void> close() {
    player.dispose();
    return super.close();
  }
}
