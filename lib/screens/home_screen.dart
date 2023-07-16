import 'package:amazonclone2/widgets/categories_horizontal_list_view.dart';
import 'package:amazonclone2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadyOnly: true,
        hasBackButton: false,
      ),
      body: const SingleChildScrollView(
          child: Column(children: [CategoriesHorizontalListView()])),
    );
  }
}
