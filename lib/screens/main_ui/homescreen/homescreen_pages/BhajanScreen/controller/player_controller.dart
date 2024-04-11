import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayerController  extends GetxController{

  final audioPlayer = AudioPlayer();

  @override
  void onInit(){
    super.onInit();
  }

  playSong(String? uri){
    try{
      audioPlayer.setAudioSource(
        AudioSource.uri(Uri.parse(uri!)),
      );
      audioPlayer.play();
    }on Exception catch(e){
      print(e.toString());
    }
  }


}