part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GetGameData extends GameEvent {
  final String page;
  final String platform;
  final String ordering;
  final String searchQuery;
  GetGameData({
    required this.page,
    required this.platform,
    required this.ordering,
    required this.searchQuery,
  });
}

class GetDetailGameData extends GameEvent {
  final String id;

  GetDetailGameData({
    required this.id,
  });
}
