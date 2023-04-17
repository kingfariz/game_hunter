import 'package:flutter/material.dart';
import '../../../helpers/themes.dart';

PreferredSizeWidget trendingAppBar() {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: darkPrimaryColor,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: const Text("High Rated MetaCritic Games"),
  );
}
