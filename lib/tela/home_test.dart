import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tabs/home_tab.dart';

class HomeTeste extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {

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
