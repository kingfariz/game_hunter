import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart';
import 'package:game_hunter/models/game_model.dart' as game_model;
import 'package:shimmer/shimmer.dart';
import '../../../helpers/functions/string_formatter.dart';
import '../../../helpers/themes.dart';
import '../widgets/screenshots_card.dart';
import '../widgets/shimmer_game_detail.dart';

class GameDetailScreen extends StatefulWidget {
  final game_model.Result gameModel;
  const GameDetailScreen(this.gameModel, {super.key});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  // int _currentImageSlider = 0;

  @override
  Widget build(BuildContext context) {
    String platformAvailabilityList = widget.gameModel.platforms!
        .map((e) => e.platform!.name.toString())
        .join(',');
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkPrimaryColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                if (state is GetDetailGameDataSuccess) {
                  return Column(
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
                              loadingBuilder: (BuildContext context,
                                  Widget child,
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
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (platformAvailabilityList
                                    .toLowerCase()
                                    .contains("playstation 5")) ...[
                                  Image.asset(
                                    'assets/images/logo_ps5.png',
                                    height: 14,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                                if (platformAvailabilityList
                                    .toLowerCase()
                                    .contains("pc")) ...[
                                  const Icon(
                                    Icons.desktop_windows_outlined,
                                    color: lightgreyColor,
                                    size: 14,
                                  ),
                                ],
                              ],
                            ),
                            Text(widget.gameModel.name!, style: titleTextStyle),
                            const SizedBox(height: 8),
                            Text(
                                widget.gameModel.released == null
                                    ? "Release Date: TBA"
                                    : "Release Date: ${StringFormatter().dateFormatter(widget.gameModel.released!)}",
                                style: releaseDateTextStyle),
                            const SizedBox(height: 4),
                            Text(
                                "MetaCritic Score: ${StringFormatter().stringNullFormatter(widget.gameModel.metacritic.toString())}",
                                style: releaseDateTextStyle),
                            const SizedBox(height: 4),
                            Text(
                                state.data.esrbRating == null
                                    ? "ESRB Rating: N/A"
                                    : "ESRB Rating: ${StringFormatter().stringNullFormatter(state.data.esrbRating!.name.toString())}",
                                style: releaseDateTextStyle),
                            const SizedBox(height: 15),
                            const Divider(
                              height: 2,
                              color: whiteColor,
                            ),
                            const SizedBox(height: 15),
                            Text(
                                "Developer : ${StringFormatter().stringNullFormatter(state.data.developers!.map((e) => e.name.toString()).join(', '))}",
                                style: releaseDateTextStyle),
                            const SizedBox(height: 4),
                            Text(
                                "Publisher : ${StringFormatter().stringNullFormatter(state.data.publishers!.map((e) => e.name.toString()).join(', '))}",
                                style: releaseDateTextStyle),
                            const SizedBox(height: 8),
                            Text(
                                StringFormatter().stringNullFormatter(
                                    state.data.descriptionRaw.toString()),
                                style: releaseDateTextStyle),
                            const SizedBox(height: 12),
                            Text(
                                "Tags : ${StringFormatter().stringNullFormatter(state.data.tags!.map((e) => e.name.toString()).join(', '))}",
                                style: releaseDateTextStyle),
                            const SizedBox(height: 22),
                            Text("ScreenShots: ",
                                style: contentHeaderTextStyle),
                            const SizedBox(height: 8),
                            CarouselSlider(
                              items: state.ssData.results!
                                  .where((e) => e.isDeleted == false)
                                  .take(10)
                                  .toList()
                                  .reversed
                                  .map((result) => ScreenShotsCard(
                                        screenShots: result,
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                viewportFraction: 1.0,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 300),
                                enlargeCenterPage: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Shimmer.fromColors(
                      baseColor: softPrimaryColor,
                      highlightColor: primaryColor,
                      child: gameDetailScreenShimmer(widget.gameModel));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
