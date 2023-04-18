import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import '../../helpers/themes.dart';
import 'bottomnav_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

List<ContentConfig> listContentConfig = [];

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    addListContent();
  }

  addListContent() async {
    listContentConfig.add(
      const ContentConfig(
        title: "",
        description: "Discover Your Favourite Games",
        pathImage: "assets/images/onboarding_sao.png",
        backgroundImage: "assets/images/onboarding_sao.png",
        backgroundColor: primaryColor,
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "",
        description: "Get Free Games",
        pathImage: "assets/images/onboarding_ps5.png",
        backgroundColor: primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: IntroSlider(
        key: UniqueKey(),
        nextButtonKey: const Key("nextButtonKey"),
        doneButtonKey: const Key("doneButtonKey"),
        listContentConfig: listContentConfig,
        skipButtonStyle: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        doneButtonStyle: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        nextButtonStyle: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
        indicatorConfig: const IndicatorConfig(
            colorIndicator: softPrimaryColor, colorActiveIndicator: blueColor),
        onDonePress: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const BottomNavScreen()));
        },
      ),
    );
  }
}
