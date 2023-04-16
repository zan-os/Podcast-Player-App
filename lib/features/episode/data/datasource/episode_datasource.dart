import 'package:dio/dio.dart';
import 'package:just_audio/just_audio.dart';

import '../model/response/episode_response.dart';
import '../../../../shared/common/constants/constant_values.dart';

abstract class EpisodeDataSource {
  Future<EpisodeResponse> getEpisode(String episodeId);
  Future<Duration> playEpisodeAudio(String audioUrl);
}

class EpisodeDataSourceImpl implements EpisodeDataSource {
  final Dio dio;
  final AudioPlayer player;

  EpisodeDataSourceImpl({
    required this.dio,
    required this.player,
  });

  @override
  Future<EpisodeResponse> getEpisode(String episodeId) async {
    try {
      final response = await dio.get(ConstantValues.apiConstant.episodeDetail + episodeId);
      return EpisodeResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Duration> playEpisodeAudio(String audioUrl) async {
    try {
      final result = await player.setUrl(audioUrl);
      return result ?? Duration.zero;
    } catch (e) {
      rethrow;
    }
  }
}
