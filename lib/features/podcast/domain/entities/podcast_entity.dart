import '../../data/model/response/podcast_response.dart';

class PodcastEntity {
  final String id;
  final String title;
  final String publisher;
  final String image;
  final String thumbnail;
  final String listennotesUrl;
  final String listenScore;
  final String listenScoreGlobalRank;
  final num totalEpisodes;
  final num audioLengthSec;
  final num updateFrequencyHours;
  final bool explicitContent;
  final String description;
  final num itunesId;
  final String rss;
  final num latestPubDateMs;
  final String latestEpisodeId;
  final num earliestPubDateMs;
  final String language;
  final String country;
  final String website;
  final Extra extra;
  final bool isClaimed;
  final String email;
  final String type;
  final LookingFor lookingFor;
  final List<num> genreIds;
  final List<EpisodeListResponse> episodes;
  final num nextEpisodePubDate;

  PodcastEntity(
      {required this.id,
      required this.title,
      required this.publisher,
      required this.image,
      required this.thumbnail,
      required this.listennotesUrl,
      required this.listenScore,
      required this.listenScoreGlobalRank,
      required this.totalEpisodes,
      required this.audioLengthSec,
      required this.updateFrequencyHours,
      required this.explicitContent,
      required this.description,
      required this.itunesId,
      required this.rss,
      required this.latestPubDateMs,
      required this.latestEpisodeId,
      required this.earliestPubDateMs,
      required this.language,
      required this.country,
      required this.website,
      required this.extra,
      required this.isClaimed,
      required this.email,
      required this.type,
      required this.lookingFor,
      required this.genreIds,
      required this.episodes,
      required this.nextEpisodePubDate});
}
