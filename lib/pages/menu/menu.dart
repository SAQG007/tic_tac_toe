import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/pages/board.dart';
import 'package:tic_tac_toe/pages/menu/menu_button.dart';
import 'package:tic_tac_toe/pages/menu/settings_button.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  bool? _musicSwitchValue;
  bool? _soundSwitchValue;

  void _navigateToBoard() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Board()));
  }

  // setting music switch value in shared preferences
  void _setMusicValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMusicOn', _musicSwitchValue!);
  }

  // setting sound switch value in shared preferences
  void _setSoundValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSoundOn', _soundSwitchValue!);
  }

  // getting music switch value from shared preferences
  void _getMusicValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _musicSwitchValue = await prefs.getBool('isMusicOn');
  }

  // getting sound switch value from shared preferences
  void _getSoundValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _soundSwitchValue = await prefs.getBool('isSoundOn');
  }

  @override
  void initState() {
    super.initState();
    _getMusicValue();
    _getSoundValue();
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
                  SettingsButton(
                    title: "Music",
                    switchValue: _musicSwitchValue!,
                    onChangedCallBack: (value) {
                      setState(() {
                        _musicSwitchValue = value;
                      });
                      _setMusicValue();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SettingsButton(
                    title: "Sound",
                    switchValue: _soundSwitchValue!,
                    onChangedCallBack: (value) {
                      setState(() {
                        _soundSwitchValue = value;
                      });
                      _setSoundValue();
                    },
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
