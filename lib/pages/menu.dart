// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:tic_tac_toe/global/utils.dart';
import 'package:tic_tac_toe/pages/board.dart';
import 'package:tic_tac_toe/widgets/menu_button.dart';
import 'package:tic_tac_toe/widgets/settings_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  final String _mailAddress = "syedabdulqadirgillani807@gmail.com";

  final Uri _linkedInUrl = Uri.parse("https://www.linkedin.com/in/syed-abdul-qadir-gillani/");
  final Uri _gitHubUrl = Uri.parse("https://github.com/SAQG007");

  void _navigateToBoard() {
    playButtonTapSound();
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Board()));
  }

  Future<void> _openMail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLauchUri = Uri(
      scheme: 'mailto',
      path: _mailAddress,
      query: encodeQueryParameters(<String, String>{
        'subject': 'Tic Tac Toe Feedback',
      }),
    );

    if (await canLaunchUrl(emailLauchUri)) {
      launchUrl(emailLauchUri);
    }
    else {
      _showErrorDialog("Error while opening mail.");
    }
  }

  Future<void> _openLinkedInProfile() async {
    if(!await launchUrl(_linkedInUrl, mode: LaunchMode.externalApplication)) {
      _showErrorDialog("Error while opening LinkedIn.");
    }
  }

  Future<void> _openGitHubProfile() async {
    if(!await launchUrl(_gitHubUrl, mode: LaunchMode.externalApplication)) {
      _showErrorDialog("Error while opening GitHub.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Error",
            ),
            content: Text(
              message,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  playButtonTapSound();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
  }

  void _showSettingsDialog() {
    playButtonTapSound();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "Settings",
              ),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingsSwitch(
                    title: "Music",
                    switchValue: isMusicOn!,
                    onChangedCallBack: (value) {
                      playButtonTapSound();
                      setState(() {
                        isMusicOn = value;
                      });
                      setMusicStatus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SettingsSwitch(
                    title: "Sound",
                    switchValue: isSoundOn!,
                    onChangedCallBack: (value) {
                      playButtonTapSound();
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

  void _showAboutDialog() {
    playButtonTapSound();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "About",
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Experience classic gameplay with a modern twist in our Tic Tac Toe app – the ultimate battle of X's and O's on your device!",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Send your feedback at:-",
              ),
              GestureDetector(
                onTap: () {
                  playButtonTapSound();
                  _openMail();
                },
                child: Text(
                  _mailAddress,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Connect with me at:-",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      playButtonTapSound();
                      _openLinkedInProfile();
                    },
                    child: Image.asset('assets/icons/linkedin.png'),
                  ),
                  GestureDetector(
                    onTap: () {
                      playButtonTapSound();
                      _openGitHubProfile();
                    },
                    child: Image.asset('assets/icons/github.png'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                playButtonTapSound();
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const RiveAnimation.asset(
            'assets/backgrounds/planet-orbit.riv',
            fit: BoxFit.cover,
            alignment: Alignment.center,
            antialiasing: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    appName,
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                  WavyAnimatedText(
                    appName,
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
                repeatForever: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              MenuButton(
                title: "New Game",
                onTap: _navigateToBoard,
              ),
              MenuButton(
                title: "Settings",
                onTap: _showSettingsDialog,
              ),
              MenuButton(
                title: "About",
                onTap: _showAboutDialog,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
