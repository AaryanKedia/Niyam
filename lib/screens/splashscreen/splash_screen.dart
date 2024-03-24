import 'dart:async';

import 'package:flutter/material.dart';
import 'package:niyam/screens/main_ui/homescreen/home_screen.dart';
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
    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {

   return const Scaffold(
     body: Center(
       child:Text("NIYAM",style: TextStyle(fontSize:defaultSize),),
     ),
   );
  }

}