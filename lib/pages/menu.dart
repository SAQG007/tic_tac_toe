import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tic_tac_toe/global/utils.dart';
import 'package:tic_tac_toe/pages/choose.dart';
import 'package:tic_tac_toe/widgets/menu_button.dart';
import 'package:tic_tac_toe/widgets/settings_button.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  void _navigateToChoose() {
    playButtonTapSound();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Choose()));
  }

  @override
  void initState() {
    super.initState();
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
                    switchValue: isMusicOn!,
                    onChangedCallBack: (value) {
                      setState(() {
                        isMusicOn = value;
                      });
                      setMusicStatus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SettingsButton(
                    title: "Sound",
                    switchValue: isSoundOn!,
                    onChangedCallBack: (value) {
                      setState(() {
                        isSoundOn = value;
                      });
                      setSoundStatus();
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
              MenuButton(title: "New Game", onTap: _navigateToChoose,),
              MenuButton(title: "Settings", onTap: _showSettingsDialog,),
              MenuButton(title: "About", onTap: () {},),
            ],
          ),
        ],
      ),
    );
  }
}
