import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/sizes.dart';
import 'package:niyam/utils/texts.dart';

class ArtiScreen extends StatelessWidget{
  const ArtiScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        extendBodyBehindAppBar: true,

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(arti,style: TextStyle(fontSize: defaultSize*1.25,fontFamily: 'hind_bold',color: baseColor),),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20,top: 15),
              child: Icon(Iconsax.information_outline,size: 26,color: Colors.white60,),
            ),
          ],
        ),
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
        ),
      );

}