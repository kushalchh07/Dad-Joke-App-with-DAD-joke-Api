

import '../../model/joke_model.dart';

abstract class DadJokeState {
  const DadJokeState();

  @override
  List<Object> get props => [];
}

class DadJokeInitial extends DadJokeState {}

class DadJokeLoading extends DadJokeState {}

class DadJokeLoaded extends DadJokeState {
  final DadJOke joke;

  const DadJokeLoaded(this.joke);

  @override
  List<Object> get props => [joke];
}

class DadJokeError extends DadJokeState {
  final String message;

  const DadJokeError(this.message);

  @override
  List<Object> get props => [message];
}
