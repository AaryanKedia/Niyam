import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/MusicPlayingScreen/MusicController/music_controller.dart';
import '../../../../../../utils/colours.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({
    super.key,
    // required this.songTitle, required this.artistName
  });

  // final String songTitle;
  // final String artistName;


  @override
  Widget build(BuildContext context) {


    MusicController musicController = Get.put(MusicController());

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff3c0008),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              musicController.pausePlaying();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: baseColor.shade200,
            )),
      ),
      body: Container(
        color: const Color(0xff3c0008),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient:
                  RadialGradient(colors: [gradient1, gradient2], radius: 1.25),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white.withOpacity(0.3)),
                      child: const Icon(
                        Icons.music_note_rounded,
                        size: 100,
                        color: gradient1,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(() => Text(
                    musicController.songName.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15, color: baseColor),
                  ),),
                  const SizedBox(height: 5,),
                  Obx(() => Text(
                    musicController.artistName.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: baseColor.shade50),
                  ),),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${musicController.currentTime}",style: TextStyle(color: baseColor.shade200),),
                          Expanded(
                            child: Slider(
                              value: musicController.sliderValue.value.clamp(0.0, musicController.sliderValue.value),
                              onChanged: (value) {
                                musicController.sliderValue.value = value;
                                Duration songPosition = Duration(seconds: value.toInt());
                                musicController.changeSongSlider(songPosition);
                              },
                              max: musicController.sliderMaxValue.value ,
                              min: 0,
                              activeColor: baseColor,
                              inactiveColor: gradient2.withOpacity(0.6),
                              // overlayColor: baseColor.shade400,
                            ),
                          ),
                          Text("${musicController.totalTime}",style: TextStyle(color: baseColor.shade200),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.skip_previous_rounded,
                        size: 50,
                        color: baseColor.shade400.withOpacity(0.85),
                      ),
                      SizedBox(
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
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.skip_next_rounded,
                        size: 50,
                        color: baseColor.shade400.withOpacity(0.85),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
