import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart';
import 'package:game_hunter/features/home/screen/home_screen.dart';
import 'package:game_hunter/features/trending/bloc/trending_bloc.dart';
import 'package:game_hunter/features/trending/screen/trending_screen.dart';
import '../../helpers/themes.dart';
import '../profile/screen/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(bottomNavigationBar: customBottomNav(), body: body()));
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return BlocProvider(
          create: (context) => GameBloc(),
          child: const HomeScreen(),
        );
      case 1:
        return BlocProvider(
          create: (context) => TrendingBloc(),
          child: const TrendingScreen(),
        );
      case 2:
        return const ProfileScreen();
      default:
        return BlocProvider(
          create: (context) => GameBloc(),
          child: const HomeScreen(),
        );
    }
  }

  Widget customBottomNav() {
    return BottomNavigationBar(
        backgroundColor: darkPrimaryColor,
        unselectedItemColor: lightgreyColor,
        selectedItemColor: blueColor,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 4, bottom: 4),
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 4, bottom: 4),
              child: const Icon(Icons.trending_up_outlined),
            ),
            label: 'High Rated Games',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(top: 4, bottom: 4),
              child: const Icon(Icons.perm_identity),
            ),
            label: 'Profile',
          ),
        ]);
  }
}
