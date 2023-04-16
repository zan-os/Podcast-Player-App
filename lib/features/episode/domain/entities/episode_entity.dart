class EpisodeEntity {
  EpisodeEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.pubDateMs,
    required this.audio,
    required this.audioLengthSec,
    required this.listennotesUrl,
    required this.image,
    required this.maybeAudioInvalid,
    required this.listennotesEditUrl,
    required this.explicitContent,
    required this.link,
    required this.guidFromRss,
  });

  String id;
  String title;
  String description;
  int pubDateMs;
  String audio;
  int audioLengthSec;
  String listennotesUrl;
  String image;
  bool maybeAudioInvalid;
  String listennotesEditUrl;
  bool explicitContent;
  String link;
  String guidFromRss;
}
