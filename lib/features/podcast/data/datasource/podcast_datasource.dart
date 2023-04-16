import 'package:dio/dio.dart';

import '../../../../shared/common/constants/constant_values.dart';
import '../model/response/podcast_response.dart';

abstract class PodcastDataSource {
  Future<PodcastResponse> getPodcast();
}

class PodcastDataSourceImpl implements PodcastDataSource {
  final Dio dio;

  PodcastDataSourceImpl({required this.dio});

  @override
  Future<PodcastResponse> getPodcast() async {
    try {
      final response = await dio.get(ConstantValues.apiConstant.podcastDetail);
      return PodcastResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
