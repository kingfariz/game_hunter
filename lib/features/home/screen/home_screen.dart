import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart';
import 'package:game_hunter/features/home/widgets/game_list.dart';
import 'package:game_hunter/features/home/widgets/home_appbar.dart';
import 'package:game_hunter/helpers/functions/system_log.dart';
import 'package:game_hunter/helpers/themes.dart';

import '../../../helpers/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCtrl = TextEditingController(text: '');
  bool isloading = false;
  bool isASC = false;
  String sortBy = "";
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
    getData(page: currentIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: homeAppBar(
          isLoading: isloading,
          isASC: isASC,
          sortingMode: () async {
            isASC = !isASC;
            getData(
                page: "1",
                searchQuery: searchCtrl.text.toString().trim(),
                ordering: sortBy);
          },
          actionWidget: [
            PopupMenuButton<String>(
              onSelected: appbarAction,
              itemBuilder: (BuildContext context) {
                return {
                  Params.orderingName,
                  Params.orderingReleased,
                  Params.orderingAdded,
                  Params.orderingCreated,
                  Params.orderingUpdated,
                  Params.orderingRating,
                  Params.orderingMetacritic,
                }.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          searchWidget: Expanded(
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
            getData(
                page: "1",
                searchQuery: searchCtrl.text.toString().trim(),
                ordering: sortBy);
          }),
      body: SafeArea(
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GetGameDataSuccess) {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (currentIndex > 1) ...[
            FloatingActionButton(
              onPressed: () {
                if (currentIndex > 1) {
                  currentIndex--;
                }
                getData(
                    page: currentIndex.toString(),
                    searchQuery: searchCtrl.text.toString().trim(),
                    ordering: sortBy);
              },
              backgroundColor: softPrimaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 20),
          ],
          FloatingActionButton(
            onPressed: () {
              currentIndex++;
              getData(
                  page: currentIndex.toString(),
                  searchQuery: searchCtrl.text.toString().trim(),
                  ordering: sortBy);
            },
            backgroundColor: softPrimaryColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }

  void appbarAction(String value) {
    getData(
        page: "1",
        searchQuery: searchCtrl.text.toString().trim(),
        ordering: value);
  }

  void getData({
    required String page,
    String platform = "187",
    String ordering = "-released",
    String searchQuery = "",
  }) async {
    if (isASC == false) {
      ordering = "-$ordering";
    }
    final GameBloc crudBloc = BlocProvider.of<GameBloc>(context);
    crudBloc.add(GetGameData(
        page: page,
        ordering: ordering,
        platform: platform,
        searchQuery: searchQuery));
  }
}
