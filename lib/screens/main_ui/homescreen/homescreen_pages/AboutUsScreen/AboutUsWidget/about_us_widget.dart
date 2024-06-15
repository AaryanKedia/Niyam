import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/AboutUsScreen/about_screen.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 8,
      top: 1,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, top: 10),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutScreen(
                          documentId: 'aboutUs',
                          name: 'हमारा परिचय',
                          lines: ['space','parichay1.1','space','mobile1','mobile2','whatsappNumber','address','parichay2','parichay3','parichay1.2','parichay1.3'])));
            },
            child: const Icon(
              Iconsax.information_outline,
              size: 30,
              color: Colors.white60,
            )),
      ),
    );
  }
}
