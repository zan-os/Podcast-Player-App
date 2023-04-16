import 'package:get_it/get_it.dart';
import 'features/episode/di/episode_injection.dart';
import 'features/podcast/di/podcast_injection.dart';
import 'shared/core/di/core_injection.dart';

final sl = GetIt.instance;

class RegisteredInjection {
  static void init() {
    _registeredCoreInjection();
    _registeredPodcastInjection();
    _registerEpisodeInjection();
  }

  static void _registeredCoreInjection() {
    CoreInjection();
  }

  static void _registeredPodcastInjection() {
    PodcastInjection();
  }

  static void _registerEpisodeInjection() {
    EpisodeInjection();
  }
}
