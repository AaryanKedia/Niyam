import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/ArtiScreen/ArtiOptionScreens/artis.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/ArtiScreen/artiWidgets/arti_option_widget.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/sizes.dart';
import 'package:niyam/utils/texts.dart';

class ArtiScreen extends StatelessWidget {
  const ArtiScreen({super.key});

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

    const List<Widget> screens =[

      // Ganesh Arti
      ArtisScreen(documentId: 'ganesh_arti',name: ganeshArtiAppbar, lines: ["space","space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12",],),

      // Ambe Arti
      ArtisScreen(documentId: 'ambe_arti',name:ambeArtiAppbar,lines: ["space", "line2", "line3", "line4","space", "line5", "line6","line4","space", "line7", "line8","line4","space","line9","line10","line4",
        "space","line11","line12","line4","space","line13","line14","line4","space","line15","line16","line4","space","line17","line18","line4","space","line19","line20","line4","space","line21","line22",
        "line4","space","line23","line24","line4","space","line25","line26","line4","space","line27","line28","line4","space",],),

      // Ram Stuti
      ArtisScreen(documentId: 'ram_stuti',name: ramStutiAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12","line13","line14",
        "space","line15","line16","line17","space","line18","line19","line20","space",],),

      // Jagdish Arti
      ArtisScreen(documentId: 'jagdish_arti',name: jagdeshartiAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12","line13",
        "line14","line15","line16","line17","line18","line19","line20","space",],),

      //Sankat Mochan
      ArtisScreen(documentId: 'sankat_mochan',name: sankatMochanAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12","line13",
        "line14","line15","line16","line17","line18","line19","space",],),

      // Hanuman Chalisa
      ArtisScreen(documentId: 'hanuman_chalisa',name: hanumanChalisaAppbar, lines: ["space",
        "line1", "line2", "line3", "line4", "line5", "space","line6", "line7", "line8", "line9", "line10", "line11", "line12","line13","line14","line15","line16","line17","line18","line19","line20",
        "line21", "line22", "line23", "line24", "line25", "line26", "line27", "line28", "line29", "line30", "line31", "line32","line33","line34","line35","line36","line37","line38","line39","line40",
        "line41", "line42", "line43", "line44", "line45", "line46", "line47", "line48", "line49", "line50", "line51", "line52","line53","line54","line55","line56","line57","line58","line59","line60",
        "line61", "line62", "line63", "line64", "line65", "line66", "line67", "line68", "line69", "line70", "line71", "line72","line73","line74","line75","line76","line77","line78","line79","line80",
        "line81", "line82", "line83", "line84", "line85", "line86", "space","line1","line87", "line88","space",],),

      // Bhog Arti
      ArtisScreen(documentId: 'bhog_arti',name: bhogArtiAppbar, lines: ["space","line1","line2","line3","space","line4","line5","line6","space","line7","line8","line9","space","line10","line11","line12",
        "space","line13","line14","line15","space","line16","line17","line18","space"],),

      // Lhr Lhr
      ArtisScreen(documentId: 'lhrlhr',name: lhrlhrAppbar, lines: ["space","line1","line2","line1","space","line3","line4","line1","space","line3","line5","line1","space","line3","line6","line1","space",
        "line3","line7","line1","space","line3","line8","line1","space","line3","line9","line1","space","line3","line10","line1","space","line3","line11","line1","space",
      "line12","line13","line14","line15","line16","line17","line18","line19","line20","line21","line22","space","line23","line24","line25","space","line26","line21","line1","space" ],),

      // Naw Chali
      ArtisScreen(documentId: 'now_chali',name: nowChaliAppbar, lines: ["space","line1","line2","line3","line4","space","line5","line6","line7","line8","space","line9","line10",""
          "line11","line12","space","line13","line14","line15","line16","space","line17","line18","line19","line20","line21","space","line22","line23","space",],),

      // Jhanki
      ArtisScreen(documentId: 'jhanki', name: jhankiAppbar, lines: ["space","repeat","line1","space","line2","line3","repeat","space","line4","line5","repeat","space","line6","line7","repeat","space",
        "line8","line9","repeat","space","line10","line11","repeat","space","line12","line13","repeat","space","line14","line15","repeat","space","line16","line17","repeat","space",
        "line18","line19","repeat","space","line20","line21","line22","repeat","space","line23","repeat","space",]),

      // Bajrang Ban
      ArtisScreen(documentId: 'bajrang_ban',name: bajrangBanAppbar, lines: ["space","line1", "line2","space", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12",
        "line13","line14","line15","line16","line17","line18","line19","line20","line21", "line22", "line23", "line24", "line25", "line26", "line27", "line28", "line29", "line30", "line31", "line32","line33",
        "line34","line35","line36","line37","line38","line39","line40", "line41", "line42", "line43", "line44", "line45", "line46", "line47", "line48", "line49", "line50", "line51", "line52","line53","line54",
        "line55","line56","line57","line58","line59","line60","line61", "line62", "line63", "line64", "line65", "line66", "line67", "space","line68", "line69", "line70","space" ],),


      //HanuMan Jaikara
      ArtisScreen(documentId: 'hanuman_jaikara',name: hanumanJaykaraAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6","line3", "line7", "line8", "line9", "line10", "line11", "line12",
        "line2","line13","line14","line15","line16","line17","line18","line19","line20","line21","line22","line23","line24","line25","line26","line27","line1","line2","line3","line28","line1","line2","line3","line29",
        "line1","line2","line3","line30","line1","line2","line3","line31","line32","line31","space"],),


      //JaiJaiKar
      ArtisScreen(documentId: 'jaijaikar',name: jaiJaikarAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12","line13","line14","line15",
        "line16","line17","line18","line19","line20","line21","space"],),


      //Bhagwan Ko
      ArtisScreen(documentId: 'bhagwan_ko',name: bhagwanKoAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12","line13","line14","line15",
        "line16","line17","line18","line19","line20","line21","line22","space"],),


      //Balaji Mahraj
      ArtisScreen(documentId: 'balaji_mahraj',name: balajiMahrajAppbar, lines: ["space","line1", "line2", "line3", "line4", "line5", "line6", "line7", "line8", "line9", "line10", "line11", "line12","line13","line14",],),

    ];
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
                  child: Stack(

                    children: [
                      Center(
                        child: Text(
                          arti,
                          style: TextStyle(
                            fontSize: defaultSize * 1.25,
                            fontFamily: 'hind_bold',
                            color: baseColor,
                          ),
                        ),
                      ),

                      Positioned(
                         right: 8,
                        top: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20,top: 10),
                          child: Icon(Iconsax.information_outline,size: 30,color: Colors.white60,),
                        ),
                      ),
                    ],
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
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> screens[index]));
                            },
                          ),
                          const SizedBox(height: 20,)
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
