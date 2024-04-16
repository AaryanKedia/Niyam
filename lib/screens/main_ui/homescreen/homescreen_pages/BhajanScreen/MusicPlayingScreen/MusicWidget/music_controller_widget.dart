import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../../../utils/colours.dart';
import '../../controller/cloud_storage_controller.dart';
import '../../model/my_song_model.dart';
import '../MusicController/music_controller.dart';

class MusicControllerWidget extends StatelessWidget {
  const MusicControllerWidget({
    super.key,
    required this.cloudStorageController,
    required this.musicController,
  });

  final CloudStorageController cloudStorageController;
  final MusicController musicController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            List<MySongModel> list = cloudStorageController.cloudSongList;
            musicController.playPreviousSong(list);
          },
          child: Icon(
            Icons.skip_previous_rounded,
            size: 50,
            color: baseColor.shade400.withOpacity(0.85),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Obx(
          () => musicController.isPlaying.value
              ? InkWell(
                  onTap: () {
                    musicController.pausePlaying();
                  },
                  child: Icon(
                    Icons.pause_circle_outline_rounded,
                    size: 80,
                    color: baseColor.shade900,
                  ))
              : InkWell(
                  onTap: () {
                    musicController.resumePlaying();
                  },
                  child: Icon(
                    Icons.play_circle_outline_rounded,
                    size: 80,
                    color: baseColor.shade900,
                  )),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () async {
            List<MySongModel> list = cloudStorageController.cloudSongList;
            musicController.playNextSong(list);
          },
          child: Icon(
            Icons.skip_next_rounded,
            size: 50,
            color: baseColor.shade400.withOpacity(0.85),
          ),
        ),
      ],
    );
  }
}
