
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/MusicPlayingScreen/MusicController/music_controller.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/MusicPlayingScreen/music_player_screen.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/controller/cloud_storage_controller.dart';
import '../../../../../utils/colours.dart';
import '../../../../../utils/texts.dart';
import '../../homeScreenWidget/home_header_widget.dart';

class BhajanScreen extends StatelessWidget {
  const BhajanScreen({super.key});



  @override
  Widget build(BuildContext context) {

    // PlayerController playerController = Get.put(PlayerController());
    CloudStorageController cloudSongController = Get.put( CloudStorageController());
    MusicController musicController = Get.put(MusicController());
    return Scaffold(

      extendBodyBehindAppBar: false,
      body: Container(
        color: const Color(0xff3c0008),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [gradient1, gradient2], radius: 1.25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:HomeHeaderWidget(
                    text: bhajan,
                  ),
                ),

                // SONG LISTING

          Expanded(
            child: Obx(
                  () => cloudSongController.isLoading.value
                  ? const Center(child: CircularProgressIndicator(
                    color: baseColor,
                  ))
                  :
                  Column(
                    children: cloudSongController.cloudSongList.value.map((e) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: (){
                          musicController.playCloudAudio(e);
                          Get.to(const MusicPlayerScreen());
                        },
                        child: ListTile(
                          title: Text(
                            "${e.title}",
                            style: const TextStyle(fontSize: 18,color: baseColor,fontFamily: 'hind_medium'),
                          ),
                          subtitle: Text(
                            "${e.artist}",
                            style: TextStyle(fontSize: 15,color: baseColor.shade50,fontFamily: 'hind'),
                          ),
                          leading: Icon(Icons.music_note,color: baseColor.shade900,),

                        ),
                      ),
                    )).toList(),
                  )
            ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
