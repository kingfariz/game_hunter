import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart';
import 'package:game_hunter/helpers/functions/system_log.dart';
import 'package:game_hunter/helpers/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getData(page: "1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocConsumer<GameBloc, GameState>(
              listener: (context, state) {
                if (state is GetGameDataSuccess) {
                  systemLog(state.data.toString());
                }
              },
              builder: (context, state) {
                return const SpinKitChasingDots(
                  size: 50,
                  color: softPrimaryColor,
                );
              },
            ),
            const Text('Hello World'),
          ],
        ),
      ),
    );
  }

  void getData(
      {required String page,
      String platform = "187",
      String ordering = "-released"}) async {
    final GameBloc crudBloc = BlocProvider.of<GameBloc>(context);
    crudBloc
        .add(GetGameData(page: page, ordering: ordering, platform: platform));
  }
}
