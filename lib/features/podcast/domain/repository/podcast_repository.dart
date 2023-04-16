import 'package:dartz/dartz.dart';
import '../entities/podcast_entity.dart';
import '../../../../shared/common/components/response/error/failure_response.dart';

abstract class PodcastRepository {
  Future<Either<FailureResponse, PodcastEntity>> fetchPodcast();
}
