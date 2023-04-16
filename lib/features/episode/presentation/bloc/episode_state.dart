import 'package:equatable/equatable.dart';
import '../../domain/entities/episode_entity.dart';

abstract class EpisodeState extends Equatable {}

class EpisodeInitial extends EpisodeState {
  @override
  List<Object?> get props => [];
}

class FetchEpisodeLoading extends EpisodeState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchEpisodeFailed extends EpisodeState {
  final String messsage;

  FetchEpisodeFailed(this.messsage);
  @override
  List<Object?> get props => [messsage];
}

class FetchEpisodeSuccess extends EpisodeState {
  final EpisodeEntity episode;

  FetchEpisodeSuccess(this.episode);
  @override
  List<Object?> get props => [episode];
}

class AudioPlayed extends EpisodeState {
  final Duration? current;
  final Duration? buffered;
  final Duration? total;

  AudioPlayed({this.current, this.buffered, this.total});

  @override
  List<Object?> get props => [current, buffered, total];
}

class AudioPaused extends EpisodeState {
  @override
  List<Object?> get props => [];
}

class AudioLoading extends EpisodeState {
  @override
  List<Object?> get props => [];
}

class AudioStopped extends EpisodeState {
  @override
  List<Object?> get props => [];
}
