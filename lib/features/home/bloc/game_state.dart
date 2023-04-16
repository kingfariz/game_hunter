part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameLoadingState extends GameState {}

class GetGameDataSuccess extends GameState {
  final List<dynamic> data;
  GetGameDataSuccess(this.data);
  List<Object?> get props => [data];
}
