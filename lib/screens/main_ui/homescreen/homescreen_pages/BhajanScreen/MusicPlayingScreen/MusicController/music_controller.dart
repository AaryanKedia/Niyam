import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/model/my_song_model.dart';

class MusicController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxString currentTime = "0".obs;
  RxString totalTime = "0".obs;
  RxDouble sliderValue = 0.0.obs;
  RxDouble sliderMaxValue = 0.0.obs;
  RxString songName = "".obs;
  RxString artistName = "".obs;
  RxInt currentPlaying = 0.obs;

  void playCloudAudio(MySongModel songModel) async {
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

  void playNextSong(List<MySongModel> list) {
    int nextIndex = currentPlaying.value + 1;
    if (nextIndex >= 0 && nextIndex < list.length) {
      MySongModel nextSong = list[nextIndex];
      playCloudAudio(nextSong);
      currentPlaying.value = nextIndex;
    } else if (nextIndex == list.length) {
      // Reached the end of the list, loop back to the first song
      MySongModel firstSong = list[0];
      playCloudAudio(firstSong);
      currentPlaying.value = 0;
    }
  }


  void playPreviousSong(List<MySongModel> list) {
    int previousIndex = currentPlaying.value - 1;
    if (previousIndex >= 0) {
      MySongModel previousSong = list[previousIndex];
      playCloudAudio(previousSong);
      currentPlaying.value = previousIndex;
    } else if (previousIndex < 0) {
      // Reached the beginning of the list, loop to the last song
      int lastIndex = list.length - 1;
      MySongModel lastSong = list[lastIndex];
      playCloudAudio(lastSong);
      currentPlaying.value = lastIndex;
    }
  }




  void pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  void changeSongSlider(Duration position) {
    player.seek(position);
  }

  void updatePosition() async {
    try {
      player.durationStream.listen((event) {
        totalTime.value = event.toString().split(".")[0];
        sliderMaxValue.value = event!.inSeconds.toDouble();
      });
      player.positionStream.listen((event) {
        currentTime.value = event.toString().split(".")[0];
        sliderValue.value = event.inSeconds.toDouble();
      });
    } catch (e) {
      print(e);
    }
  }
}
