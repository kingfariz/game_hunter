import 'package:flutter/material.dart';
import 'package:game_hunter/models/game_model.dart' as game_model;
import 'package:shimmer/shimmer.dart';

import '../../../helpers/functions/string_formatter.dart';
import '../../../helpers/themes.dart';

class GameDetailScreen extends StatefulWidget {
  final game_model.Result gameModel;
  const GameDetailScreen(this.gameModel, {super.key});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkPrimaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (widget.gameModel.backgroundImage != null &&
                        widget.gameModel.backgroundImage! != "null")
                    ? Image.network(
                        widget.gameModel.backgroundImage!,
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
                      Text(widget.gameModel.name!, style: titleTextStyle),
                      const SizedBox(height: 8),
                      Text(
                          "Release Date: ${StringFormatter().dateFormatter(widget.gameModel.released!)}",
                          style: releaseDateTextStyle),
                      const SizedBox(height: 4),
                      Text(
                          "MetaCritic Score: ${StringFormatter().stringNullFormatter(widget.gameModel.metacritic.toString())}",
                          style: releaseDateTextStyle),
                      const SizedBox(height: 4),
                      Text(
                          "ESRB Rating: ${StringFormatter().stringNullFormatter("")}",
                          style: releaseDateTextStyle),
                      const SizedBox(height: 15),
                      const Divider(
                        height: 2,
                        color: whiteColor,
                      ),
                      const SizedBox(height: 15),
                      Text(
                          "Developer : ${StringFormatter().stringNullFormatter("")}",
                          style: releaseDateTextStyle),
                      const SizedBox(height: 4),
                      Text(
                          "Publisher : ${StringFormatter().stringNullFormatter("")}",
                          style: releaseDateTextStyle),
                      const SizedBox(height: 8),
                      Text(
                          StringFormatter().stringNullFormatter(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eu justo quis erat rutrum accumsan. Fusce quis porttitor orci. Maecenas quis suscipit lacus. Nam tristique ut elit a tristique. Mauris mattis lorem erat, ut fermentum enim consectetur blandit. Integer nisi ex, consequat eget ex fermentum, feugiat congue orci. Fusce vel ultricies ex."),
                          style: releaseDateTextStyle),
                      const SizedBox(height: 12),
                      Text(
                          "Tags : ${StringFormatter().stringNullFormatter("")}",
                          style: releaseDateTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
