import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';

import '../datasource/episode_datasource.dart';
import '../model/mapper/episode_mapper.dart';
import '../../domain/entities/episode_entity.dart';
import '../../domain/repository/episode_repository.dart';
import '../../../../shared/common/components/response/error/failure_response.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeDataSource dataSource;
  final EpisodeMapper mapper;

  EpisodeRepositoryImpl({required this.dataSource, required this.mapper});

  @override
  Future<Either<FailureResponse, EpisodeEntity>> fetchEpisode(String episodeId) async {
    try {
      final response = await dataSource.getEpisode(episodeId);
      return Right(mapper.mapEpisodeResponseToEntity(response));
    } on DioError catch (e) {
      return Left(
        FailureResponse(
            errorMessage: e.response?.data["message"]?.toString() ??
                "Something went wrong",
            statusCode: e.response?.data["status_code"] ?? 422),
      );
    }
  }

  @override
  Future<Either<FailureResponse, Duration>> playAudio(String audioUrl) async {
    try {
      final result = await dataSource.playEpisodeAudio(audioUrl);
      return Right(result);
    } on PlayerException catch (e) {
      return Left(FailureResponse(
          errorMessage: e.message ?? "Unexpected Error", statusCode: e.code));
    } on PlayerInterruptedException catch (e) {
      return Left(
          FailureResponse(errorMessage: e.message ?? "Unexpected Error"));
    } catch (e) {
      return Left(FailureResponse(errorMessage: "Unexpected Error: $e"));
    }
  }
}
