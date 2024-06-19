import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/LyricsScreen/LyricsWidget/Controller/lyrics_controller.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/LyricsScreen/LyricsWidget/Model/show_lyrics.dart';

import '../../../../../../../utils/colours.dart';
import 'Controller/lyrics_content_controller.dart';

class LyricsName extends StatelessWidget {
  const LyricsName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    LyricsContentController lyricsContentController = Get.put(LyricsContentController());
    LyricsController lyricsController = Get.put(LyricsController());
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Obx(
                  () => lyricsController.isLoading.value
                  ? const Center(
                child: CircularProgressIndicator(
                  color: baseColor,
                ),
              )
                  : ListView(
                children: lyricsController.LyricsList.value.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.92,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: (){
                          lyricsContentController.loadLyrics(e);
                          Get.to(()=> const ShowLyrics());
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                          ),
                          backgroundColor: baseColor.withOpacity(0.3),
                          elevation: 15,
                          shadowColor: Colors.red.shade600,
                        ),
                          child: ListTile(
                            title: Text(
                              "${e.name}",
                              textAlign: TextAlign.center,
                              style:  TextStyle(fontSize: 22, color: baseColor.shade600, fontFamily: 'hind_semi_bold',wordSpacing: 7),
                            ),
                            // leading: Icon(
                            //   Icons.music_note,
                            //   color: baseColor.shade900,
                            // ),
                          ),
                      ),
                    ),
                  );


                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}