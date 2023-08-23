import 'package:flame_audio/flame_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isMusicOn;
bool? isSoundOn;

// setting music switch value in shared preferences
void setMusicStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isMusicOn', isMusicOn!);
  playBackgroundMusic();
}

// setting sound switch value in shared preferences
void setSoundStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isSoundOn', isSoundOn!);
}

// getting music switch value from shared preferences
void getMusicStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isMusicOn = prefs.getBool('isMusicOn') ?? true;
  playBackgroundMusic();
}

// getting sound switch value from shared preferences
void getSoundStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isSoundOn = prefs.getBool('isSoundOn') ?? true;
}

void playBackgroundMusic() {
  isMusicOn! ? FlameAudio.bgm.play('background.mp3') : FlameAudio.bgm.pause();
}

void playButtonTapSound() async {
  await FlameAudio.play('button.mp3');
}
