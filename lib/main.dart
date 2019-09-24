import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reconhecedor_facial_flutter/tela/home_test.dart';

Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.last;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Viagens',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomeTeste(
        firstCamera,
      ),
    ),
  );
}
