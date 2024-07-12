import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Commons/bottom_nav.dart';

class FeedViewScreen extends StatelessWidget {
  const FeedViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomNav())
        ],
      ),
    );
  }
}
