import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:niyam/screens/main_ui/homescreen/home_screen.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/images.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen2();
}

class _SplashScreen2 extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const HomeScreen()),);
      Get.off(() => const HomeScreen(),transition: Transition.circularReveal);
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
                logo2,
                width: MediaQuery.sizeOf(context).width*0.98,
                height: MediaQuery.sizeOf(context).height,
                // height: splashScreenLogoHeight,
                fit: BoxFit.fill,
              ),
            )),
      ),
    );
  }
}
