import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayerController extends GetxController {
  final audioPlayer = AudioPlayer();

  playSong(String? uri) {
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
