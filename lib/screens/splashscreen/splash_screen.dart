import 'dart:async';

import 'package:flutter/material.dart';
import 'package:niyam/screens/main_ui/homescreen/home_screen.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/images.dart';
import 'package:niyam/utils/sizes.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreen();

}

class _SplashScreen extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       decoration: const BoxDecoration(
         gradient: RadialGradient(
           colors: [
            gradient1,
             gradient2
           ],
           radius: 1.25
         )
       ),
       child: Center(
         child:Image.asset(logo,width:splashScreenLogoWidth,height: splashScreenLogoHeight,)
       ),
     ),
   );
  }

}