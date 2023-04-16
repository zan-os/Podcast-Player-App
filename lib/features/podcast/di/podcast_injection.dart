import '../data/datasource/podcast_datasource.dart';
import '../data/mapper/podcast_mapper.dart';
import '../data/repository/podcast_repository_impl.dart';
import '../domain/repository/podcast_repository.dart';
import '../domain/usecase/fetch_podcast_usecase.dart';
import '../../../registered_injection.dart';

class PodcastInjection {
  PodcastInjection() {
    _registerDataSource();
    _registerMapper();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<PodcastDataSource>(
        () => PodcastDataSourceImpl(dio: sl()));
  }

  _registerMapper() {
    sl.registerLazySingleton<PodcastMapper>(() => PodcastMapper());
  }

  _registerRepository() {
    sl.registerLazySingleton<PodcastRepository>(
        () => PodcastRepositoryImpl(dataSource: sl(), mapper: sl()));
  }

  _registerUseCase() {
    sl.registerLazySingleton<FetchPodcastUseCase>(
        () => FetchPodcastUseCase(repository: sl()));
  }
}
