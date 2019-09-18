import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tabs/passageiros_tab.dart';
import 'package:reconhecedor_facial_flutter/widgets/custom_drawer.dart';

class FunctionScreen extends StatelessWidget {
  final PageController pageController;
  final String string;

  FunctionScreen(this.pageController, this.string);

  Widget _buildBodyBack() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 237, 213, 57),
            Color.fromARGB(255, 230, 230, 230)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(pageController),
          body: Stack(
            children: <Widget>[
              _buildBodyBack(),
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(
                        'Posicione seu rosto',
                        style: TextStyle(color: Colors.black),
                      ),
                      centerTitle: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Scaffold(
            drawer: CustomDrawer(pageController),
            body: PassageirosTab(pageController, string),
        )
      ],
    );
  }
}
