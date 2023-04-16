import 'package:dartz/dartz.dart';
import 'package:just_audio/just_audio.dart';
import '../repository/episode_repository.dart';

import '../../../../shared/common/components/response/error/failure_response.dart';
import '../../../../shared/core/usecase/base_usecase.dart';

class PlayEpisodeAudioUseCase extends BaseUseCase<void, String> {
  final EpisodeRepository repository;
  final AudioPlayer player;

  PlayEpisodeAudioUseCase({
    required this.repository,
    required this.player,
  });

  @override
  Future<Either<FailureResponse, void>> build(String params) =>
      repository.playAudio(params);
}
