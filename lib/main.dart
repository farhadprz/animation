import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'constants.dart';

void main() {
  setUpDesktop();
  runApp(const MyApp());
}

void setUpDesktop() {
  const double windowWidth = 480;
  const double windowHeight = 854;

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Animation Samples');
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    setWindowMinSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) => setWindowFrame(Rect.fromCenter(
          center: screen!.frame.center,
          width: windowWidth,
          height: windowHeight,
        )));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Animation Samples',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
      routerConfig: router,
    );
  }
}
