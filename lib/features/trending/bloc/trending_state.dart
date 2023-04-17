part of 'trending_bloc.dart';

@immutable
abstract class TrendingState {}

class GameLoadingState extends TrendingState {}

class GetGameDataEmpty extends TrendingState {}

class GetGameDataSuccess extends TrendingState {
  final game_model.GameModel data;
  final bool statusNextPage;
  GetGameDataSuccess(this.data, this.statusNextPage);
  List<Object?> get props => [data, statusNextPage];
}

class GetDetailGameDataSuccess extends TrendingState {
  final detail_game_model.DetailGameModel data;
  final screenshots_model.ScreenShotsGameModel ssData;

  GetDetailGameDataSuccess(
    this.data,
    this.ssData,
  );
  List<Object?> get props => [data, ssData];
}
