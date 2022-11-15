import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app_bloc/bloc/joke_bloc/joke.state.dart';
import 'package:joke_app_bloc/bloc/joke_bloc/joke_event.dart';

import '../../data/repo/joke_repository.dart';
class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokeLoadingState());
      try {
        final joke = await _jokeRepository.getJoke();
        emit(JokeLoadedState(joke));
      } catch (e) {
        emit(JokeErrorState(e.toString()));
      }
    });
  }
}