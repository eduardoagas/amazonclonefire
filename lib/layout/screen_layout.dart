import 'package:amazonclone2/utils/color_themes.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    int currentPage = 0;

    @override
    void dispose() {
      super.dispose();
      pageController.dispose();
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(color: Colors.grey[400]!, width: 1))),
          child: TabBar(
              indicator: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: activeCyanColor, width: 4),
                ),
              ),
              onTap: (int page) {
                pageController.jumpToPage(page);
                setState(() {
                  currentPage = page;
                });
              },
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Icon(
                    Icons.home_outlined,
                    color: currentPage == 0 ? activeCyanColor : Colors.black,
                  ),
                ),
                Tab(
                  child: Icon(Icons.account_circle_outlined,
                      color: currentPage == 1 ? activeCyanColor : Colors.black),
                ),
                Tab(
                  child: Icon(Icons.shopping_cart_checkout_outlined,
                      color: currentPage == 2 ? activeCyanColor : Colors.black),
                ),
                Tab(
                  child: Icon(Icons.menu,
                      color: currentPage == 3 ? activeCyanColor : Colors.black),
                ),
              ]),
        ),
      ),
    );
  }
}
