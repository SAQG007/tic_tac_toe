import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/global/utils.dart';
import 'package:tic_tac_toe/pages/menu.dart';
import 'package:tic_tac_toe/theme/theme.dart';

void main() {
  runApp(const MyApp());
  
  // fix the orientation to portrait up
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  /* when the app is terminated or sent to background,
  this instance will automatically pause or resume the background music */
  FlameAudio.bgm.initialize();

  getMusicStatus();
  getSoundStatus();
  getAppName();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const Menu(),
    );
  }
}
