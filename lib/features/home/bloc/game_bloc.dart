import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:game_hunter/helpers/constants.dart';
import 'package:game_hunter/models/game_model.dart' as game_model;
import 'package:meta/meta.dart';

import '../../../../helpers/functions/system_log.dart';
import '../../../../services/dio_setting.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameLoadingState()) {
    on<GetGameData>((event, emit) async {
      try {
        emit(GameLoadingState());
        Response response = await getConnect(
          endpoint: EndPoints.games,
          ordering: event.ordering,
          platform: event.platform,
          page: event.page,
          searchQuery: event.searchQuery,
        );
        if (response.statusCode == 200) {
          if (response.data["count"] != 0) {
            game_model.GameModel gameModel =
                game_model.gameModelFromJson(response.toString());
            if (response.data['next'] != null) {
              emit(GetGameDataSuccess(gameModel, true));
            } else {
              emit(GetGameDataSuccess(gameModel, false));
            }
          } else {
            emit(GetGameDataEmpty());
          }
        } else {
          systemLog(
              "Failed to get data with response code ${response.statusCode}");
        }
      } catch (e, stackTrace) {
        systemLog(e.toString());
        systemLog(stackTrace.toString());
      }
    });
  }
}
