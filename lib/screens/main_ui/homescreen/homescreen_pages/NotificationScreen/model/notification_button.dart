import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/NotificationScreen/model/notification_screen.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
            Get.to(() => const NotificationScreen(),transition: Transition.circularReveal);
        },
        child: const Icon(
          Icons.notifications,
          size: 30,
          color: Colors.white60,
        ));
  }
}