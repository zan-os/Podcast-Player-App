import 'package:dartz/dartz.dart';
import '../entities/podcast_entity.dart';
import '../repository/podcast_repository.dart';
import '../../../../shared/common/components/response/error/failure_response.dart';
import '../../../../shared/core/usecase/base_usecase.dart';

class FetchPodcastUseCase extends BaseUseCase<PodcastEntity, NoParams> {
  final PodcastRepository repository;

  FetchPodcastUseCase({required this.repository});

  @override
  Future<Either<FailureResponse, PodcastEntity>> build(NoParams params) async =>
      repository.fetchPodcast();
}
