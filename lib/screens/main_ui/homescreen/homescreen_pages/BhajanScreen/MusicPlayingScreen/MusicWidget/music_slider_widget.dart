import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../../../utils/colours.dart';
import '../MusicController/music_controller.dart';

class MusicSliderWidget extends StatelessWidget {
  const MusicSliderWidget({
    super.key,
    required this.musicController,
  });

  final MusicController musicController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${musicController.currentTime}",
              style: TextStyle(color: baseColor.shade200),
            ),
            Expanded(
              child: Slider(
                value: musicController.sliderValue.value
                    .clamp(0.0, musicController.sliderValue.value),
                onChanged: (value) {
                  musicController.sliderValue.value = value;
                  Duration songPosition = Duration(seconds: value.toInt());
                  musicController.changeSongSlider(songPosition);
                },
                max: musicController.sliderMaxValue.value,
                min: 0,
                activeColor: baseColor,
                inactiveColor: gradient2.withOpacity(0.6),
                // overlayColor: baseColor.shade400,
              ),
            ),
            Text(
              "${musicController.totalTime}",
              style: TextStyle(color: baseColor.shade200),
            ),
          ],
        ),
      ),
    );
  }
}
