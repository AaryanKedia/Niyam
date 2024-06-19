import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../utils/colours.dart';
import 'LyricsWidget/lyrics_name_widget.dart';

class LyricsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LyricsScreen();
}

class _LyricsScreen extends State<LyricsScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "भजन के बोल",
          style: TextStyle(color: baseColor.shade300, fontSize: 26),
        ),
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
         child: const LyricsName()
          ),
        ),
      ),
    );
  }
}


