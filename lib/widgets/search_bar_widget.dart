import 'package:amazonclone2/constants.dart';
import 'package:amazonclone2/utils/color_themes.dart';
import 'package:amazonclone2/utils/utils.dart';
import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isReadyOnly;
  final bool hasBackButton;
  SearchBarWidget(
      {Key? key, required this.isReadyOnly, required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.grey, width: 1));

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: backgroundGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        hasBackButton
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
            : Container(),
        SizedBox(
          width: screenSize.width * 0.7,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 10))
            ]),
            child: TextField(
              readOnly: isReadyOnly,
              onTap: () {
                if (isReadyOnly) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                }
              },
              decoration: InputDecoration(
                hintText: "Search for something in Amazon",
                fillColor: Colors.white,
                filled: true,
                border: border,
                focusedBorder: border,
              ),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.mic_none_outlined))
      ]),
    );
  }
}
