part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameLoadingState extends GameState {}

class GetGameDataEmpty extends GameState {}

class GetGameDataSuccess extends GameState {
  final game_model.GameModel data;
  final bool statusNextPage;
  GetGameDataSuccess(this.data, this.statusNextPage);
  List<Object?> get props => [data, statusNextPage];
}

class GetDetailGameDataSuccess extends GameState {
  final detail_game_model.DetailGameModel data;
  final screenshots_model.ScreenShotsGameModel ssData;

  GetDetailGameDataSuccess(
    this.data,
    this.ssData,
  );
  List<Object?> get props => [data, ssData];
}
