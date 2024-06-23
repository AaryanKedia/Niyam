import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colours.dart';
import '../../../../utils/sizes.dart';
import '../homescreen_pages/AboutUsScreen/AboutUsWidget/about_us_widget.dart';
import '../homescreen_pages/NotificationScreen/model/notification_button.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.text,
  });

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      const NotificationButton(),
        Text(
          text,
          style: const TextStyle(
            fontSize: defaultSize * 1.25,
            fontFamily: 'hind_bold',
            color: baseColor,
          ),
        ),
        const AboutUsWidget(),
      ],
    );
  }
}


