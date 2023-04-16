import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:game_hunter/helpers/constants.dart';
import 'package:meta/meta.dart';

import '../../../../helpers/functions/system_log.dart';
import '../../../../services/dio_setting.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial()) {
    on<GetGameData>((event, emit) async {
      try {
        Response response = await getConnect(
          endpoint: EndPoints.games,
          ordering: event.ordering,
          platform: event.platform,
          page: event.page,
        );
        if (response.statusCode == 200) {
          emit(GetGameDataSuccess(jsonDecode(response.toString())['results']));
        } else {
          systemLog("Failed to get data");
        }
      } catch (e) {
        systemLog(e.toString());
      }
    });
  }
}
