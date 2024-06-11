import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/model/my_song_model.dart';
import '../../controller/cloud_storage_controller.dart';

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
  RxBool backAvail = false.obs;
  CloudStorageController cloudStorageController =
  Get.put(CloudStorageController());


  Future<void> playCloudAudio(MySongModel songModel,) async {
    songName.value = songModel.title!;
    artistName.value = songModel.artist!;
    currentPlaying.value = songModel.id!;
    await player.setAudioSource(AudioSource.uri(Uri.parse(songModel.data!)));
    player.play();
    List<MySongModel> list = cloudStorageController.cloudSongList;
    updatePosition(list);
    isPlaying.value = true;
    backAvail.value = true;
  }

  void resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  Future<void> playNextSong(List<MySongModel> list) async {
    int nextIndex = currentPlaying.value + 1;
    if (nextIndex >= 0 && nextIndex < list.length) {
      MySongModel nextSong = list[nextIndex];
      await playCloudAudio(nextSong);
      currentPlaying.value = nextIndex;
    } else if (nextIndex == list.length) {
      // Reached the end of the list, loop back to the first song
      MySongModel firstSong = list[0];
      await playCloudAudio(firstSong);
      currentPlaying.value = 0;
    }
    // await player.seekToNext();
  }

  void playPreviousSong(List<MySongModel> list) async{
    int previousIndex = currentPlaying.value - 1;
    if (previousIndex >= 0) {
      MySongModel previousSong = list[previousIndex];
      await playCloudAudio(previousSong);
      currentPlaying.value = previousIndex;
    } else if (previousIndex < 0) {
      // Reached the beginning of the list, loop to the last song
      int lastIndex = list.length - 1;
      MySongModel lastSong = list[lastIndex];
      await playCloudAudio(lastSong);
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

  void updatePosition(List<MySongModel> songList) async {
    try {
      player.durationStream.listen((event) {
        if (event != null) {
          totalTime.value = event.toString().split(".")[0];
          sliderMaxValue.value = event.inSeconds.toDouble();
        }
      });

      player.positionStream.listen((event) {
        currentTime.value = event.toString().split(".")[0];
        sliderValue.value = event.inSeconds.toDouble();

        // Check if the current time equals the total time
        if (sliderValue.value == sliderMaxValue.value ) {
          playNextSong(songList);
        }
      });
    }  catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
