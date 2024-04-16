import 'package:flutter/material.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/texts.dart';
import '../../../../../utils/lists.dart';
import '../../homeScreenWidget/home_header_widget.dart';
import 'artiWidgets/arti_names_widget.dart';

class ArtiScreen extends StatelessWidget {
  const ArtiScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: HomeHeaderWidget(
                    text: arti,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ArtiNamesWidget(text: text, screens: screens),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
