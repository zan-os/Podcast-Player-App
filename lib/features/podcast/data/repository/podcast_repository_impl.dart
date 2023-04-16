import 'package:dio/dio.dart';
import '../datasource/podcast_datasource.dart';
import '../mapper/podcast_mapper.dart';
import '../../domain/entities/podcast_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/podcast_repository.dart';
import '../../../../shared/common/components/response/error/failure_response.dart';

class PodcastRepositoryImpl implements PodcastRepository {
  final PodcastDataSource dataSource;
  final PodcastMapper mapper;

  PodcastRepositoryImpl({required this.dataSource, required this.mapper});

  @override
  Future<Either<FailureResponse, PodcastEntity>> fetchPodcast() async {
    try {
      final response = await dataSource.getPodcast();
      return Right(mapper.mapPodcastResponseToEntity(response));
    } on DioError catch (e) {
      return Left(
        FailureResponse(
          errorMessage:
              e.response?.data["message"]?.toString() ?? "Something went wrong",
              statusCode: e.response?.data["status_code"] ?? 422
        ),
      );
    }
  }
}
