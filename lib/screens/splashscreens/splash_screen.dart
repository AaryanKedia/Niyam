import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:niyam/screens/splashscreens/splash_screen_2.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/images.dart';

import '../../utils/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => const SplashScreen2()));
      Get.off(() => const SplashScreen2(),transition: Transition.zoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient:
                RadialGradient(colors: [gradient1, gradient2], radius: 1.25)),
        child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                        logo,
                        height: splashScreenLogoHeight,
                        width: splashScreenLogoWidth,
                      ),
            )),
      ),
    );
  }
}
