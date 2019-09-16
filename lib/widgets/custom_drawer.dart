import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tiles/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 203, 236, 241),
          Color.fromARGB(255, 255, 255, 255)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 0.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                height: 160.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Nome Empresa",
                          style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Bem vindo, ",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.person, "Tela embarque", pageController,0),
              DrawerTile(Icons.list, "Lista Passageiros", pageController, 1),
            ],
          ),
        ],
      ),
    );
  }
}