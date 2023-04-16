import 'package:bloc/bloc.dart';
import '../../domain/usecase/fetch_podcast_usecase.dart';
import 'podcast_event.dart';
import 'podcast_state.dart';
import '../../../../shared/core/usecase/base_usecase.dart';

class PodcastBloc extends Bloc<PodcastEvent, PodcastState> {
  final FetchPodcastUseCase useCase;

  PodcastBloc({required this.useCase}) : super(PodcastInitial()) {
    on<FetchPodcast>(
      (event, emit) async {
        emit(PodcastLoading());
        final result = await useCase.build(NoParams());
        result.fold((failure) => emit(PodcastFailed(failure.errorMessage)),
            (result) => emit(PodcastLoaded(result)));
      },
    );
  }
}
  