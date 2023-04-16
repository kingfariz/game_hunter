import 'package:flutter/material.dart';
import 'package:game_hunter/helpers/functions/system_log.dart';
import '../../../helpers/themes.dart';

class GameList extends StatelessWidget {
  const GameList({super.key});

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
              Image.network(
                'https://media.rawg.io/media/games/8f0/8f067578df893bcdd24177ac65998729.jpg',
                height: 200,
                width: double.maxFinite,
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
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
                    Text("Cities: Skylines", style: titleTextStyle),
                    const SizedBox(height: 2),
                    Text("Release Date: Feb 11, 2023",
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
