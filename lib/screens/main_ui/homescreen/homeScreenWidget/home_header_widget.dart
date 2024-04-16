import 'package:flutter/cupertino.dart';
import '../../../../utils/colours.dart';
import '../../../../utils/sizes.dart';
import '../homescreen_pages/AboutUsScreen/AboutUsWidget/about_us_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.text,
  });

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: defaultSize * 1.25,
              fontFamily: 'hind_bold',
              color: baseColor,
            ),
          ),
        ),
        const AboutUsWidget(),
      ],
    );
  }
}
