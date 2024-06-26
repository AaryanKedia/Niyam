import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/MusicPlayingScreen/MusicController/music_controller.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/controller/cloud_storage_controller.dart';
import '../../../../../../utils/colours.dart';
import '../../../../../../AdSetUp/ads_display.dart';
import 'MusicWidget/music_controller_widget.dart';
import 'MusicWidget/music_details_widget.dart';
import 'MusicWidget/music_logo_widget.dart';
import 'MusicWidget/music_slider_widget.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MusicController musicController = Get.put(MusicController());
    CloudStorageController cloudStorageController =
        Get.put(CloudStorageController());

    return WillPopScope(
      onWillPop: () async {
        if (musicController.backAvail.value) {
          musicController.pausePlaying();
          musicController.backAvail.value = false;
          return true;
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
              ),
              backgroundColor: const Color(0xff3c0008),

              elevation: 2,
              duration: const Duration(seconds: 1),
              content: Text("कृपया भजन लोड होने दें",style: TextStyle(color: baseColor.shade500,fontWeight: FontWeight.bold),textAlign: TextAlign.center ,),
            ),
          );
        }
        return false;
      },
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: const Color(0xff3c0008),
          leading: InkWell(
              onTap: () {
                if (musicController.backAvail.value) {
                  musicController.pausePlaying();
                  musicController.backAvail.value = false;
                  Navigator.of(context).pop();

                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                      ),
                      backgroundColor: const Color(0xff3c0008),

                      elevation: 2,
                      duration: const Duration(seconds: 1),
                      content: Text("कृपया भजन लोड होने दें",style: TextStyle(fontSize:15,color: baseColor.shade500,fontWeight: FontWeight.bold),textAlign: TextAlign.center ,),
                    ),
                  );
                }
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
                gradient: RadialGradient(
                    colors: [gradient1, gradient2], radius: 1.25),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.075,
                    ),
                    const MusicLogoWidget(),
                    const SizedBox(
                      height: 50,
                    ),

                    //SONG  NAME AND ARTIST NAME
                    MusicDetailsWidget(musicController: musicController),

                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),

                    // SLIDER CONTROLLER
                    MusicSliderWidget(
                        musicController: musicController
                    ),


                    const SizedBox(height: 10),
                    const SizedBox(height: 10),

                    // MUSIC CONTROLLER

                    MusicControllerWidget(
                        cloudStorageController: cloudStorageController,
                        musicController: musicController),


                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: const Ads(),
      ),
    );
  }
}

