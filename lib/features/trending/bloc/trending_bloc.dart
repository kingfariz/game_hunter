import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:game_hunter/helpers/constants.dart';
import 'package:game_hunter/models/game_model.dart' as game_model;
import 'package:game_hunter/models/game_detail_model.dart' as detail_game_model;
import 'package:game_hunter/models/game_screenshots_model.dart'
    as screenshots_model;
import 'package:meta/meta.dart';

import '../../../../helpers/functions/system_log.dart';
import '../../../../services/dio_setting.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendingBloc() : super(GameLoadingState()) {
    on<GetGameData>((event, emit) async {
      try {
        emit(GameLoadingState());
        Response response = await getTrendingGameData(
          endpoint: EndPoints.games,
          ordering: event.ordering,
          page: event.page,
          searchQuery: event.searchQuery,
        );
        if (response.statusCode == 200) {
          systemLog(response.toString());
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

    on<GetDetailGameData>((event, emit) async {
      try {
        emit(GameLoadingState());
        Response response = await getDetailGameData(
          endpoint: EndPoints.games,
          id: event.id,
        );
        Response responseScreenshots = await getScreenShotsGameData(
          endpoint: EndPoints.games,
          id: event.id,
        );
        if (response.statusCode == 200 &&
            responseScreenshots.statusCode == 200) {
          systemLog(response.data.toString());
          if (response.data["detail"] != "Not found") {
            detail_game_model.DetailGameModel detailGameModel =
                detail_game_model.detailGameModelFromJson(response.toString());

            screenshots_model.ScreenShotsGameModel ssGameModel =
                screenshots_model.screenShotsGameModelFromJson(
                    responseScreenshots.toString());

            emit(GetDetailGameDataSuccess(detailGameModel, ssGameModel));
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
