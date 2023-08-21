import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tic_tac_toe/pages/board.dart';
import 'package:tic_tac_toe/pages/menu/menu_button.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  void _navigateToBoard() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Board()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            'assets/backgrounds/stars.riv',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            antialiasing: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(title: "New Game", onTap: _navigateToBoard),
              MenuButton(title: "Settings", onTap: () {},),
              MenuButton(title: "About", onTap: () {},),
            ],
          ),
        ],
      ),
    );
  }
}
