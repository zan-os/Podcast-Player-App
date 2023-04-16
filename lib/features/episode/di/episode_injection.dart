import '../data/datasource/episode_datasource.dart';
import '../domain/usecase/play_episode_audio_usecase.dart';

import '../../../registered_injection.dart';
import '../data/model/mapper/episode_mapper.dart';
import '../data/repository/episode_repository_impl.dart';
import '../domain/repository/episode_repository.dart';
import '../domain/usecase/fetch_episode_usecase.dart';

class EpisodeInjection {
  EpisodeInjection() {
    _registerDataSource();
    _registerMapper();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<EpisodeDataSource>(
        () => EpisodeDataSourceImpl(dio: sl(), player: sl()));
  }

  _registerMapper() {
    sl.registerLazySingleton<EpisodeMapper>(() => EpisodeMapper());
  }

  _registerRepository() {
    sl.registerLazySingleton<EpisodeRepository>(
        () => EpisodeRepositoryImpl(dataSource: sl(), mapper: sl()));
  }

  _registerUseCase() {
    sl.registerLazySingleton<FetchEpisodeUseCase>(
        () => FetchEpisodeUseCase(repository: sl()));
    sl.registerLazySingleton<PlayEpisodeAudioUseCase>(
        () => PlayEpisodeAudioUseCase(repository: sl(), player: sl()));
  }
}
