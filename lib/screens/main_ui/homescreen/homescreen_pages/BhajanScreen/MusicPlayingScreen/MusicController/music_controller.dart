import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/model/my_song_model.dart';

class MusicController extends GetxController{

  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songName = "".obs;
  RxString artistName ="".obs;
  RxInt currentPlaying = 0.obs;

  void playCloudAudio(MySongModel songModel)async{

        songName.value = songModel.title!;
        artistName.value = songModel.artist!;
        currentPlaying.value = songModel.id!;
        await player.setAudioSource(AudioSource.uri(Uri.parse(songModel.data!)));
        player.play();
        updatePosition();
        isPlaying.value = true;
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  void pausePlaying() async{
    isPlaying.value = false;
    await player.pause();
  }

  void changeSongSlider(Duration position){
    player.seek(position);
  }

  void updatePosition() async{
    try{
      player.durationStream.listen((event) {
        totalTime.value = event.toString().split(".")[0];
        sliderMaxValue.value = event!.inSeconds.toDouble();
      });
      player.positionStream.listen((event) {
        currentTime.value = event.toString().split(".")[0];
        sliderValue.value = event.inSeconds.toDouble();
      });
    }catch(e){
      print(e);
    }
  }
}