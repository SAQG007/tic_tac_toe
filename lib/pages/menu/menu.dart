import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tic_tac_toe/pages/board.dart';
import 'package:tic_tac_toe/pages/menu/menu_button.dart';
import 'package:tic_tac_toe/pages/menu/settings_button.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final bool _musicSwitchValue = true;
  final bool _soundSwitchValue = true;

  void _navigateToBoard() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Board()));
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingsButton(title: "Music", switchValue: _musicSwitchValue),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SettingsButton(title: "Sound", switchValue: _soundSwitchValue),
                ],
              );
            }
          ),
        );
      }
    );
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
              MenuButton(title: "Settings", onTap: _showSettingsDialog,),
              MenuButton(title: "About", onTap: () {},),
            ],
          ),
        ],
      ),
    );
  }
}
