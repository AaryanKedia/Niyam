import 'package:flutter/material.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/AboutUsScreen/AboutUsWidget/about_us_widget.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/sizes.dart';
import 'package:niyam/utils/texts.dart';

class BhajanScreen extends StatelessWidget{
  const BhajanScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        extendBodyBehindAppBar: false,
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
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Stack(

                      children: [
                        Center(
                          child: Text(
                            bhajan,
                            style: TextStyle(
                              fontSize: defaultSize * 1.25,
                              fontFamily: 'hind_bold',
                              color: baseColor,
                            ),
                          ),
                        ),

                        AboutUsWidget(),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );

}