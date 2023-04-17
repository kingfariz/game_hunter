import 'package:game_hunter/helpers/themes.dart';
import 'package:game_hunter/models/game_screenshots_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScreenShotsCard extends StatelessWidget {
  final Result screenShots;
  const ScreenShotsCard({super.key, required this.screenShots});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      screenShots.image!,
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
    );
  }
}
