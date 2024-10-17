import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Repositories/joke_repository.dart';
import 'joke_event.dart';
import 'joke_state.dart';

class DadJokeBloc extends Bloc<DadJokeEvent, DadJokeState> {
  final DadJokeRepository repository;

  DadJokeBloc(this.repository) : super(DadJokeInitial()) {
    on<GenerateJokeEvent>((event, emit) async {
      emit(DadJokeLoading());

      try {
        final joke = await repository.fetchRandomJoke();
        if (joke != null) {
          emit(DadJokeLoaded(joke));
        } else {
          emit(DadJokeError("Failed to load joke"));
        }
      } catch (e) {
        emit(DadJokeError("An error occurred: $e"));
      }
    });
  }
}
