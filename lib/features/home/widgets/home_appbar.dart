import 'package:flutter/material.dart';
import '../../../helpers/themes.dart';

PreferredSizeWidget homeAppBar({
  required Widget searchWidget,
  required List<Widget> actionWidget,
  required Function() function,
  required Function() sortingMode,
  required bool isLoading,
  required bool isASC,
  required String orderingText,
}) {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: darkPrimaryColor,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: actionWidget,
    title: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: 40,
                padding:
                    const EdgeInsets.only(top: 6, bottom: 6, right: 8, left: 8),
                decoration: BoxDecoration(
                    color: softPrimaryColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    searchWidget,
                    GestureDetector(
                      onTap: () {
                        if (isLoading == false) {
                          function();
                        }
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
        const SizedBox(width: 20),
        Column(
          children: [
            GestureDetector(
              onTap: sortingMode,
              child: Container(
                width: 60,
                height: 35,
                decoration: BoxDecoration(
                  color: softPrimaryColor,
                  border: Border.all(color: softPrimaryColor),
                  borderRadius: BorderRadius.zero,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      orderingText,
                      style: releaseDateTextStyle.copyWith(fontSize: 8),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      isASC == false ? 'DSC' : 'ASC',
                      style: releaseDateTextStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
