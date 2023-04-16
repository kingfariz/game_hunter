part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GetGameData extends GameEvent {
  final String page;
  final String platform;
  final String ordering;
  GetGameData({
    required this.page,
    required this.platform,
    required this.ordering,
  });
}
