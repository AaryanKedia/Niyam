import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../../../utils/colours.dart';
import '../MusicController/music_controller.dart';

class MusicDetailsWidget extends StatelessWidget {
  const MusicDetailsWidget({
    super.key,
    required this.musicController,
  });

  final MusicController musicController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            musicController.songName.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: baseColor, fontFamily: 'hind_semi_bold'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Obx(
          () => Text(
            musicController.artistName.value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                color: baseColor.shade50,
                fontFamily: 'hind_medium'),
          ),
        ),
      ],
    );
  }
}
