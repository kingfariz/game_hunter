part of 'trending_bloc.dart';

@immutable
abstract class TrendingEvent {}

class GetGameData extends TrendingEvent {
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

class GetDetailGameData extends TrendingEvent {
  final String id;

  GetDetailGameData({
    required this.id,
  });
}
