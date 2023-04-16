import '../response/episode_response.dart';
import '../../../domain/entities/episode_entity.dart';

class EpisodeMapper {
  EpisodeEntity mapEpisodeResponseToEntity(EpisodeResponse response) =>
      EpisodeEntity(
        id: response.id,
        title: response.title,
        description: response.description,
        pubDateMs: response.pubDateMs,
        audio: response.audio,
        audioLengthSec: response.audioLengthSec,
        listennotesUrl: response.listennotesUrl,
        image: response.image,
        maybeAudioInvalid: response.maybeAudioInvalid,
        listennotesEditUrl: response.listennotesEditUrl,
        explicitContent: response.explicitContent,
        link: response.link,
        guidFromRss: response.guidFromRss,
      );
}
