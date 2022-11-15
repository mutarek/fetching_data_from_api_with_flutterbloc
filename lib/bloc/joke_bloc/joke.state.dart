import 'package:equatable/equatable.dart';
import '../../data/model/joke_model.dart';

abstract class JokeState extends Equatable {}

class JokeLoadingState extends JokeState {
  @override
  List<Object?> get props => [];
}

class JokeLoadedState extends JokeState {
  final JokeModel jokeModel;

  JokeLoadedState(this.jokeModel);

  @override
  List<Object?> get props => [jokeModel];
}

class JokeErrorState extends JokeState {
  final String error;

  JokeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
