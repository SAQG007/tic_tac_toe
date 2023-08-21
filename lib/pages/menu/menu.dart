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

  bool _musicSwitchValue = true;
  bool _tapSoundValue = true;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Music",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Switch(
                        value: _musicSwitchValue,
                        onChanged: (bool value) {
                          setState(() {
                            _musicSwitchValue = value;
                          });
                        }
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sound",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Switch(
                        value: _tapSoundValue,
                        onChanged: (bool value) {
                          setState(() {
                            _tapSoundValue = value;
                          });
                        }
                      ),
                    ],
                  ),
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
