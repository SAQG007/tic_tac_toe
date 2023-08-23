import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/pages/menu.dart';
import 'package:tic_tac_toe/theme/theme.dart';

void main() {
  runApp(const MyApp());
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
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
