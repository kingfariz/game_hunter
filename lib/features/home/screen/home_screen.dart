import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart';
import 'package:game_hunter/features/home/widgets/game_list.dart';
import 'package:game_hunter/helpers/functions/system_log.dart';
import 'package:game_hunter/helpers/themes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController(text: '');

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
        toolbarHeight: 60,
        backgroundColor: darkPrimaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
                    height: 35,
                    padding: const EdgeInsets.only(
                        top: 6, bottom: 6, right: 8, left: 8),
                    decoration: BoxDecoration(
                        color: lightgreyColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: appbarSearchTextStyle,
                            controller: searchCtrl,
                            keyboardType: TextInputType.text,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30)
                            ],
                            decoration: InputDecoration.collapsed(
                                hintText: 'Cari',
                                hintStyle: appbarSearchTextStyle),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            systemLog("clicked");
                          },
                          child: const Icon(
                            Icons.search_outlined,
                            size: 17,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GetGameDataSuccess) {
              systemLog(state.data.toString());
            }
          },
          builder: (context, state) {
            if (state is GameLoadingState) {
              return const SpinKitChasingDots(
                size: 50,
                color: softPrimaryColor,
              );
            } else {
              return ListView(children: [
                GameList(),
                GameList(),
                GameList(),
              ]);
            }
          },
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
