import 'package:flutter/material.dart';

import 'my_drawer.dart';

class SearchPage extends StatelessWidget {
  static const String routeName = Routes.search;
  static const Color greyColor = const Color(0xffe0e0e0);

  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Stack(
        children: const <Widget>[
          Align(
            alignment: Alignment(0, -0.55),
            child: Icon(
              Icons.search,
              size: 90,
              color: greyColor,
            ),
          ),
          Center(
            child: Text(
              '<!-- Page content goes here -->',
              style: TextStyle(
                color: greyColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
