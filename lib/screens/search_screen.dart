import 'package:amazonclone2/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadyOnly: false, hasBackButton: true),
    );
  }
}
