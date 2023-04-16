import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:game_hunter/helpers/constants.dart';
import 'package:game_hunter/models/game_model.dart' as GameModel;
import 'package:meta/meta.dart';

import '../../../../helpers/functions/system_log.dart';
import '../../../../services/dio_setting.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameLoadingState()) {
    on<GetGameData>((event, emit) async {
      try {
        Response response = await getConnect(
          endpoint: EndPoints.games,
          ordering: event.ordering,
          platform: event.platform,
          page: event.page,
        );
        if (response.statusCode == 200) {
          GameModel.GameModel gameModel =
              GameModel.gameModelFromJson(response.toString());
          emit(GetGameDataSuccess(gameModel));
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
