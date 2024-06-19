import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/LyricsScreen/LyricsWidget/Controller/lyrics_content_controller.dart';
import '../../../../../../../../utils/colours.dart';
import '../../../../../../../../AdSetUp/ads_display.dart';
import '../Controller/lyrics_controller.dart';

class ShowLyrics extends StatelessWidget {
  const ShowLyrics({super.key});

  @override
  Widget build(BuildContext context) {
    LyricsContentController lyricsContentController =
        Get.put(LyricsContentController());
    LyricsController lyricsController = Get.put(LyricsController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: baseColor.shade200,
            )),
        centerTitle: true,
        title: Obx(() => Text(
              lyricsContentController.lyricsName.value,
              style: TextStyle(color: baseColor.shade300, fontSize: 26),
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
            child: Obx(() => lyricsController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: baseColor,
                    ),
                  )
                : SingleChildScrollView(
                    child: InteractiveViewer(
                      minScale: 1,
                      maxScale: 8,
                      scaleEnabled: true,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            lyricsContentController.lyrics.value
                                .replaceAll("_b", "\n"),
                            style: TextStyle(
                              color: baseColor.shade600,
                              fontSize: 20,
                              fontFamily: 'hind_medium',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )),
          ),
        ),
      ),
      bottomNavigationBar: const Ads(),
    );
  }
}
