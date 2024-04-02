import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/ArtiScreen/artiWidgets/arti_option_widget.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/sizes.dart';
import 'package:niyam/utils/texts.dart';

class ArtiScreen extends StatelessWidget {
  const ArtiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> text = <String>[
      ganeshArti,
      ambeArti,
      ramStuti,
      jagdeshArti,
      sankatmochanArti,
      hanumanChalisa,
      bhogArti,
      lhrlhr,
      bajranbaliNow,
      jhanki,
      bajrangBan,
      hanumanJaykara,
      jayJaykar,
      bhagwanKo,
      balajiMahraj
    ];
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: SafeArea(
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
                child: Text(
                  arti,
                  style: TextStyle(
                    fontSize: defaultSize * 1.25,
                    fontFamily: 'hind_bold',
                    color: baseColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: text.length, // Adjust the itemCount as needed
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ArtiOptionWidget(
                          text: text[index],
                          onTap: () {},
                        ),
                        SizedBox(height: 20,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
