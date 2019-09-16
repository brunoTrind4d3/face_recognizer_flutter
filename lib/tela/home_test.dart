import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tabs/home_tab.dart';

class HomeTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
      return PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            body: HomeTab(_pageController),
          ),
        ],
      );
  }
}
