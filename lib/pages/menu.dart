import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/pages/board.dart';
import 'package:tic_tac_toe/widgets/menu_button.dart';
import 'package:tic_tac_toe/widgets/settings_button.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  bool? _isMusicOn;
  bool? _isSoundOn;

  void _navigateToBoard() {
    _isSoundOn! ? _playButtonTapSound() : null;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Board()));
  }

  // setting music switch value in shared preferences
  void _setMusicStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMusicOn', _isMusicOn!);
    _playBackgroundMusic();
  }

  // setting sound switch value in shared preferences
  void _setSoundStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSoundOn', _isSoundOn!);
  }

  // getting music switch value from shared preferences
  void _getMusicStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isMusicOn = prefs.getBool('isMusicOn') ?? true;
    _playBackgroundMusic();
  }

  // getting sound switch value from shared preferences
  void _getSoundStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isSoundOn = prefs.getBool('isSoundOn') ?? true;
  }

  void _playBackgroundMusic() {
    _isMusicOn! ? FlameAudio.bgm.play('background.mp3') : FlameAudio.bgm.pause();
  }

  void _playButtonTapSound() async {
    await FlameAudio.play('button.mp3');
  }

  @override
  void initState() {
    super.initState();
    _getMusicStatus();
    _getSoundStatus();
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
                    switchValue: _isMusicOn!,
                    onChangedCallBack: (value) {
                      setState(() {
                        _isMusicOn = value;
                      });
                      _setMusicStatus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SettingsButton(
                    title: "Sound",
                    switchValue: _isSoundOn!,
                    onChangedCallBack: (value) {
                      setState(() {
                        _isSoundOn = value;
                      });
                      _setSoundStatus();
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
              MenuButton(title: "New Game", onTap: _navigateToBoard,),
              MenuButton(title: "Settings", onTap: _showSettingsDialog,),
              MenuButton(title: "About", onTap: () {},),
            ],
          ),
        ],
      ),
    );
  }
}
