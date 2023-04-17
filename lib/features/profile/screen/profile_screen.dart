import 'package:flutter/material.dart';
import 'package:game_hunter/helpers/themes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Container(
              color: softPrimaryColor,
              height: 160,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sample Account", style: titleTextStyle),
                        const SizedBox(height: 10),
                        Text("This is your bio.", style: releaseDateTextStyle),
                      ],
                    ),
                    const Icon(
                      Icons.account_box_rounded,
                      size: 120.0,
                      color: blueColor,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(8),
                          color: softGreyColor,
                          child: Column(children: [
                            Text("Games Owned", style: scoreTextStyle),
                            const SizedBox(height: 4),
                            Text("25",
                                style: primaryBigTextStyle.copyWith(
                                    color: Colors.amber)),
                          ]),
                        ),
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.all(8),
                          color: softGreyColor,
                          child: Column(children: [
                            Text("Games Reviewed", style: scoreTextStyle),
                            const SizedBox(height: 4),
                            Text("24",
                                style: primaryBigTextStyle.copyWith(
                                    color: Colors.amber)),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8),
                    color: softGreyColor,
                    child: Column(children: [
                      Text("Recent Activity", style: scoreTextStyle),
                      const SizedBox(height: 4),
                      Text("3.4 hours past 2 weeks",
                          style: primaryBigTextStyle.copyWith(
                              color: Colors.amber)),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
