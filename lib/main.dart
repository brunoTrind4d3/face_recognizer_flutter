import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tela/home_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Viagens',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeTeste()
    );
  }
}
