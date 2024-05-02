import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:niyam/utils/colours.dart';
import 'package:niyam/utils/texts.dart';

class ArtisScreen extends StatefulWidget {
  final String documentId;
  final String name;
  final List<String> lines;
  final double size;

  const ArtisScreen({super.key,
    required this.documentId,
    required this.name,
    required this.lines, required this.size});

  @override
  State<ArtisScreen> createState() => _ArtisScreenState();
}

class _ArtisScreenState extends State<ArtisScreen> {
  late Stream<DocumentSnapshot> artiStream;
  late BannerAd bannerAd;
  bool isAdLoaded = false;

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId:testID,
        listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad ,error){
            ad.dispose();
            print("Ad ERROR : $error");
          }
        ),
        request: const AdRequest());

    bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    getOnTheLoad();
    initBannerAd();
  }

  void getOnTheLoad() {
    artiStream = DatabaseMethods().getArtiDetails(widget.documentId);
    setState(() {});
  }

  Widget displayArtiDetails(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      return Center(
          child: Text(
            'कृपया अपना इंटरनेट चालू करें और\n पुनः प्रयास करें',
            style: TextStyle(
                color: baseColor.shade900,
                fontSize: widget.size,
                fontFamily: 'hind'),
            textAlign: TextAlign.center,
          ));
    }

    return ListView.builder(
      itemCount: widget.lines.length, // Adjust the itemCount as needed
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  data[widget.lines[index]] as String,
                  style: TextStyle(
                    color: baseColor,
                    fontSize: widget.size,
                    fontFamily: 'hind_medium',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
    // return Text(data['line1'] as String);
  }

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
          widget.name,
          style: TextStyle(color: baseColor.shade300, fontSize: 26),
        ),
      ),
      body: Container(
        color: const Color(0xff3c0008),
        child: SafeArea(
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 8,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [gradient1, gradient2], radius: 1.25),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: StreamBuilder<DocumentSnapshot>(
                  stream: artiStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: baseColor,
                          ));
                    }

                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          'कुछ तकनीकी समस्या है,\n'
                              'कृपया व्यवस्थापक से बात करें',
                          style: TextStyle(
                              color: baseColor.shade900,
                              fontSize: widget.size,
                              fontFamily: 'hind'),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    return displayArtiDetails(snapshot.data!);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: isAdLoaded ? SizedBox(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd,),
      ):const SizedBox(),
    );
  }
}

class DatabaseMethods {
  Stream<DocumentSnapshot> getArtiDetails(String documentId) {
    return FirebaseFirestore.instance
        .collection('arti_menu')
        .doc(documentId)
        .snapshots();
  }
}
