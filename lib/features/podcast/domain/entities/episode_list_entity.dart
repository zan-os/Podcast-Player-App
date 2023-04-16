class EpisodeListEntity {
  final String id;
  final String title;
  final String description;
  final num pubDateMs;
  final String audio;
  final num audioLengthSec;
  final String listennotesUrl;
  final String image;
  final bool maybeAudioInvalid;
  final String listennotesEditUrl;

  EpisodeListEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.pubDateMs,
      required this.audio,
      required this.audioLengthSec,
      required this.listennotesUrl,
      required this.image,
      required this.maybeAudioInvalid,
      required this.listennotesEditUrl});
}
