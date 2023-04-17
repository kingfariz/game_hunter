import 'package:flutter/material.dart';
import 'package:game_hunter/models/game_model.dart' as game_model;
import 'package:shimmer/shimmer.dart';

import '../../../helpers/functions/string_formatter.dart';
import '../../../helpers/themes.dart';

Widget gameDetailScreenShimmer(game_model.Result gameModel) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    (gameModel.backgroundImage != null && gameModel.backgroundImage! != "null")
        ? Image.network(
            gameModel.backgroundImage!,
            height: 200,
            width: double.maxFinite,
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Shimmer.fromColors(
                  baseColor: softPrimaryColor,
                  highlightColor: primaryColor,
                  child: Container(
                    height: 200,
                    width: double.maxFinite,
                    color: Colors.white,
                  ));
            },
          )
        : Image.asset(
            'assets/images/image_placeholder.JPG',
            height: 200,
            width: double.maxFinite,
          ),
    Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/logo_ps5.png',
                  height: 14,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.desktop_windows_outlined,
                  color: lightgreyColor,
                  size: 14,
                ),
              ],
            ),
            Text(gameModel.name!, style: titleTextStyle),
            const SizedBox(height: 8),
            Text(
                "Release Date: ${StringFormatter().dateFormatter(gameModel.released!)}",
                style: releaseDateTextStyle),
            const SizedBox(height: 4),
            Text(
                "MetaCritic Score: ${StringFormatter().stringNullFormatter(gameModel.metacritic.toString())}",
                style: releaseDateTextStyle),
          ],
        ))
  ]);
}
