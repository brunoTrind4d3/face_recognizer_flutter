import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CamPreview extends StatefulWidget {
  @override
  _CamPreviewState createState() => _CamPreviewState();
}

class _CamPreviewState extends State<CamPreview> {
  CameraController _controller;
  Future<void> _initCamFuture;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  _initApp() async {
    final cameras = await availableCameras();
    final firstCam = cameras.last;

    _controller = CameraController(
      firstCam,
      ResolutionPreset.medium,
    );

    _initCamFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 100, 15,0.0),
      child: Container(
        width: 325,
        height: 400,
        child: FutureBuilder<void>(
          future: _initCamFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}