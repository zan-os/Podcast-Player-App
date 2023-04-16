import '../../domain/entities/podcast_entity.dart';

abstract class PodcastState {}

class PodcastInitial extends PodcastState {}

class PodcastLoading extends PodcastState {}

class PodcastFailed extends PodcastState {
  final String message;

  PodcastFailed(this.message);
}

class PodcastLoaded extends PodcastState {
  final PodcastEntity podcastEntity;

  PodcastLoaded(this.podcastEntity);
}
