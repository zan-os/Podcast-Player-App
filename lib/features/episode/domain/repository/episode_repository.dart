import 'package:dartz/dartz.dart';
import '../entities/episode_entity.dart';

import '../../../../shared/common/components/response/error/failure_response.dart';

abstract class EpisodeRepository {
  Future<Either<FailureResponse, EpisodeEntity>> fetchEpisode(String episodeId);
  Future<Either<FailureResponse, Duration>> playAudio(String audioUrl);
}
