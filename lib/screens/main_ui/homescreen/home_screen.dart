import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/ArtiScreen/arti_screen.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/bhajan_screen.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/DonationScreen/donation_screen.dart';
import 'package:niyam/utils/colours.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var _selectedIndex = 0;
  final screens = [
    const ArtiScreen(),
    const BhajanScreen(),
    const DonationScreen(),
  ];
  static const List<TabItem> items = [
    TabItem(
      icon: FontAwesomeIcons.om,
      title: 'आरती',
    ),
    TabItem(
      icon: MingCute.music_3_line,
      title: 'भजन',
    ),
    TabItem(
      icon: Iconsax.money_send_outline,
      title: 'दान',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(top: 7, right: 20, left: 20),
          color: const Color(0xff3c0008),
          child: BottomBarFloating(
            items: items,
            backgroundColor: Colors.transparent,
            color: Colors.grey,
            colorSelected: baseColor.shade600,
            indexSelected: _selectedIndex,
            paddingVertical: 3,
            onTap: (int index) => setState(() {
              _selectedIndex = index;
            }),
          ),
        ),
        body: screens[_selectedIndex]);
  }
}
