
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/ArtiScreen/arti_screen.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/bhajan_screen.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/DonationScreen/donation_screen.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final controller  = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        child: Obx(
          () =>  GNav(
            gap: 10,
            backgroundColor: Colors.transparent,
            color: Colors.grey,
            activeColor: baseColor,
            tabBackgroundColor: Colors.yellow.shade200.withOpacity(0.5),

            padding: const EdgeInsets.all(10),
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (index) => controller.selectedIndex.value = index,

            tabs: const [
              GButton(
                icon: FontAwesomeIcons.om,
                text: arti,
              ),
              GButton(
                icon: MingCute.music_3_line,
                text: bhajan,
              ),
              GButton(icon: Iconsax.money_send_outline, text: donation),
            ],
          ),
        ),
      ),
    body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
final Rx<int> selectedIndex = 0.obs;
final screens = const [
  ArtiScreen(),
  BhajanScreen(),
  DonationScreen(),
];
}
