import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reconhecedor_facial_flutter/tabs/home_tab.dart';
import 'package:reconhecedor_facial_flutter/tabs/passageiros_tab.dart';
import 'package:reconhecedor_facial_flutter/tela/function_screen.dart';
import 'package:reconhecedor_facial_flutter/widgets/custom_drawer.dart';

class HomeTeste extends StatelessWidget {
  final _pageController = PageController();
  final CameraDescription cameraDescription;

  HomeTeste(this.cameraDescription);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: HomeTab(_pageController, cameraDescription),
    ));
  }
}
