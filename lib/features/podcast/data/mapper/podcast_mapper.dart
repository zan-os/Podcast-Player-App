import '../model/response/podcast_response.dart';
import '../../domain/entities/episode_list_entity.dart';
import '../../domain/entities/podcast_entity.dart';

class PodcastMapper {
  PodcastEntity mapPodcastResponseToEntity(PodcastResponse response) =>
      PodcastEntity(
          audioLengthSec: response.audioLengthSec,
          country: response.country,
          description: response.description,
          earliestPubDateMs: response.earliestPubDateMs,
          email: response.email,
          episodes: response.episodes,
          explicitContent: response.explicitContent,
          extra: response.extra,
          genreIds: response.genreIds,
          id: response.id,
          image: response.image,
          isClaimed: response.isClaimed,
          itunesId: response.itunesId,
          language: response.language,
          latestEpisodeId: response.latestEpisodeId,
          latestPubDateMs: response.latestPubDateMs,
          listenScore: response.listenScore,
          listenScoreGlobalRank: response.listenScoreGlobalRank,
          listennotesUrl: response.listennotesUrl,
          lookingFor: response.lookingFor,
          nextEpisodePubDate: response.nextEpisodePubDate,
          publisher: response.publisher,
          rss: response.rss,
          thumbnail: response.thumbnail,
          title: response.title,
          totalEpisodes: response.totalEpisodes,
          type: response.type,
          updateFrequencyHours: response.updateFrequencyHours,
          website: response.website);

  EpisodeListEntity mapEpisodesResponseToEntity(EpisodeListResponse entity) =>
      EpisodeListEntity(
          audio: entity.audio,
          audioLengthSec: entity.audioLengthSec,
          description: entity.description,
          id: entity.id,
          image: entity.image,
          listennotesEditUrl: entity.listennotesEditUrl,
          listennotesUrl: entity.listennotesUrl,
          maybeAudioInvalid: entity.maybeAudioInvalid,
          pubDateMs: entity.pubDateMs,
          title: entity.title);
}
