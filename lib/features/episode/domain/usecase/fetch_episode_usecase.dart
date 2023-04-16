import 'package:dartz/dartz.dart';

import '../entities/episode_entity.dart';
import '../repository/episode_repository.dart';

import '../../../../shared/common/components/response/error/failure_response.dart';
import '../../../../shared/core/usecase/base_usecase.dart';

class FetchEpisodeUseCase extends BaseUseCase<EpisodeEntity, String> {
  final EpisodeRepository repository;
  

  FetchEpisodeUseCase({
    required this.repository
  });
  
  @override
  Future<Either<FailureResponse, EpisodeEntity>> build(String params) =>
      repository.fetchEpisode(params);

}
