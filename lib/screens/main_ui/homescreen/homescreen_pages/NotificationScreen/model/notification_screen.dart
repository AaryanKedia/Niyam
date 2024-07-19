import 'package:flutter/material.dart';
import '../../../../../../utils/colours.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen> {


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
          "अधिसूचना",
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
              child: Center(
                  child: Text(
                    'जल्द ही उपलब्ध होगा',
                    style: TextStyle(
                        color: baseColor.shade900,
                        fontSize: 30,
                        fontFamily: 'hind'),
                    textAlign: TextAlign.center,
                  )),

          ),
        ),
      ),
    );
  }
}
