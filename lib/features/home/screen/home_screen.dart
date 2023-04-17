import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart';
import 'package:game_hunter/features/home/widgets/game_list.dart';
import 'package:game_hunter/features/home/widgets/home_appbar.dart';
import 'package:game_hunter/helpers/functions/system_log.dart';
import 'package:game_hunter/helpers/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController(text: '');
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    getData(page: "1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: homeAppBar(
          isLoading: isloading,
          widget: Expanded(
            child: TextFormField(
              style: appbarSearchTextStyle,
              controller: searchCtrl,
              keyboardType: TextInputType.text,
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              decoration: InputDecoration.collapsed(
                  hintText: 'Cari', hintStyle: appbarSearchTextStyle),
            ),
          ),
          function: () {
            String searchQuery = searchCtrl.text.toString().trim();
            getData(page: "1", searchQuery: searchQuery);
          }),
      body: SafeArea(
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GetGameDataSuccess) {
              systemLog(state.data.toString());
              setState(() {
                isloading = false;
              });
            }
            if (state is GameLoadingState) {
              setState(() {
                isloading = true;
              });
            }
          },
          builder: (context, state) {
            if (state is GetGameDataSuccess) {
              return ListView.builder(
                  itemCount: state.data.results == null
                      ? 0
                      : state.data.results!.length,
                  itemBuilder: ((context, index) {
                    if (state.data.results == null) {
                      return const Placeholder();
                    } else {
                      return GameList(
                          gameModel: state.data.results, index: index);
                    }
                  }));
            } else {
              return const SpinKitChasingDots(
                size: 50,
                color: softPrimaryColor,
              );
            }
          },
        ),
      ),
    );
  }

  void getData(
      {required String page,
      String platform = "187",
      String ordering = "-released",
      String searchQuery = ""}) async {
    final GameBloc crudBloc = BlocProvider.of<GameBloc>(context);
    crudBloc.add(GetGameData(
        page: page,
        ordering: ordering,
        platform: platform,
        searchQuery: searchQuery));
  }
}
