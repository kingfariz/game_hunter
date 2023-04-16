import 'package:flutter/material.dart';
import 'package:game_hunter/helpers/functions/system_log.dart';
import 'package:shimmer/shimmer.dart';
import '../../../helpers/functions/string_formatter.dart';
import '../../../helpers/themes.dart';
import 'package:game_hunter/models/game_model.dart' as game_model;

class GameList extends StatelessWidget {
  final List<game_model.Result>? gameModel;
  final int index;
  const GameList({
    Key? key,
    required this.gameModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        systemLog("clicked");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: darkPrimaryColor,
          margin: const EdgeInsets.only(left: 8, right: 8, top: defaultMargin),
          padding: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (gameModel![index].backgroundImage != null &&
                      gameModel![index].backgroundImage! != "null")
                  ? Image.network(
                      gameModel![index].backgroundImage!,
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
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
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
                    Text(gameModel![index].name!, style: titleTextStyle),
                    const SizedBox(height: 2),
                    Text(
                        "Release Date: ${StringFormatter().dateFormatter(gameModel![index].released!)}",
                        style: releaseDateTextStyle),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
