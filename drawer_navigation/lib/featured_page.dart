import 'package:flutter/material.dart';

import 'my_drawer.dart';

class FeaturedPage extends StatelessWidget {
  static const String routeName = Routes.browse;
  static const Color greyColor = const Color(0xffe0e0e0);

  const FeaturedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured'),
        centerTitle: true,
      ),
      body: Stack(
        children: const <Widget>[
          Align(
            alignment: Alignment(0, -0.55),
            child: Icon(
              Icons.star,
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
