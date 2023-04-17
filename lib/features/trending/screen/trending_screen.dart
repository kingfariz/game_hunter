import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart' as game_bloc;
import 'package:game_hunter/features/home/screen/game_detail_screen.dart';
import 'package:game_hunter/features/trending/widgets/game_list.dart';
import 'package:game_hunter/features/trending/bloc/trending_bloc.dart';
import 'package:game_hunter/helpers/themes.dart';
import '../widgets/home_appbar.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool isloading = false;
  String sortBy = " -updated,-metacritic";
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    getData(page: currentIndex.toString(), ordering: sortBy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: trendingAppBar(),
      body: SafeArea(
        child: BlocConsumer<TrendingBloc, TrendingState>(
          listener: (context, state) {
            if (state is GetGameDataEmpty) {
              setState(() {
                isloading = false;
              });
            }
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
            if (state is GetGameDataEmpty) {
              return const SizedBox();
            } else if (state is GetGameDataSuccess) {
              return ListView.builder(
                  itemCount: state.data.results == null
                      ? 0
                      : state.data.results!.length,
                  itemBuilder: ((context, index) {
                    if (state.data.results == null) {
                      return const Placeholder();
                    } else {
                      return GameList(
                        gameModel: state.data.results,
                        index: index,
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) =>
                                            game_bloc.GameBloc()
                                              ..add(game_bloc.GetDetailGameData(
                                                  id: state.data.results![index]
                                                      .id!)),
                                        child: GameDetailScreen(
                                            state.data.results![index]),
                                      )));
                        },
                      );
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
                getData(page: currentIndex.toString(), ordering: sortBy);
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
              getData(page: currentIndex.toString(), ordering: sortBy);
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

  void getData({
    required String page,
    required String ordering,
    String searchQuery = "",
  }) async {
    final TrendingBloc crudBloc = BlocProvider.of<TrendingBloc>(context);
    crudBloc.add(
        GetGameData(page: page, ordering: ordering, searchQuery: searchQuery));
  }
}
