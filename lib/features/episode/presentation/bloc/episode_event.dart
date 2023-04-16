abstract class EpisodeEvent {}

class AudioPlayerInit extends EpisodeEvent {}

class PlayAudio extends EpisodeEvent {}

class PauseAudio extends EpisodeEvent {}

class ResumeAudio extends EpisodeEvent {}

class StopAudio extends EpisodeEvent {}

class SeekDuration extends EpisodeEvent {
  final Duration position;

  SeekDuration({required this.position});
}

class SeekForward extends EpisodeEvent {}

class SeekBackward extends EpisodeEvent {}

class FetchEpisode extends EpisodeEvent {
  final String episodeId;

  FetchEpisode({required this.episodeId});
}

class Dispose extends EpisodeEvent{}