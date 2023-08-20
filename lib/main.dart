import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'IndieFlower-Regular',
          ),
          displaySmall: TextStyle(
            fontFamily: 'IndieFlower-Regular',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Board(),
    );
  }
}
