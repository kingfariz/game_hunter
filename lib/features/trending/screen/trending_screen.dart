import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_hunter/features/home/bloc/game_bloc.dart' as game_bloc;
import 'package:game_hunter/features/home/screen/game_detail_screen.dart';
import 'package:game_hunter/features/trending/widgets/game_list.dart';
import 'package:game_hunter/features/trending/bloc/trending_bloc.dart';
import 'package:game_hunter/helpers/themes.dart';
import 'package:game_hunter/models/game_model.dart';
import '../widgets/home_appbar.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool _isloading = false;
  final String _sortBy = " -updated,-metacritic";
  int _currentIndex = 1;
  List<Result> _trendList = [];

  @override
  void initState() {
    super.initState();

    getData(page: _currentIndex.toString(), ordering: _sortBy);
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

  _loadMore() async {
    _isloading = true;
    getData(page: (_currentIndex).toString(), ordering: _sortBy);
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
                _isloading = false;
              });
            }
            if (state is GetGameDataSuccess) {
              setState(() {
                _isloading = false;
                _currentIndex++;
                if (state.data.results == null) {
                  _trendList = [];
                } else {
                  _trendList.addAll(state.data.results!);
                }
              });
            }
            if (state is GameLoadingState) {
              setState(() {
                _isloading = true;
              });
            }
          },
          builder: (context, state) {
            if (state is GetGameDataEmpty) {
              return const SizedBox();
            } else if (state is GetGameDataSuccess && _trendList == []) {
              return const SpinKitChasingDots(
                size: 50,
                color: softPrimaryColor,
              );
            } else {
              return ListView.builder(
                  itemCount: _trendList.length,
                  itemBuilder: ((context, index) {
                    if (index >= _trendList.length - 1) {
                      if (!_isloading) {
                        _loadMore();
                      }
                      return const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    }
                    return GameList(
                      gameModel: _trendList,
                      index: index,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) => game_bloc.GameBloc()
                                        ..add(game_bloc.GetDetailGameData(
                                            id: _trendList[index].id!)),
                                      child:
                                          GameDetailScreen(_trendList[index]),
                                    )));
                      },
                    );
                  }));
            }
          },
        ),
      ),
    );
  }
}
