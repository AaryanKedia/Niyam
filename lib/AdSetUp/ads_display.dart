import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/texts.dart';

class Ads extends StatefulWidget {
  const Ads({
    super.key,
  });

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  late BannerAd bannerAd;
  bool isAdLoaded = false;

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.banner,

        // TODO
        // have to change before publish
        adUnitId:realID,
        // adUnitId: testID,

        // _----------------------
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
    initBannerAd();
  }
  @override
  Widget build(BuildContext context) {
    return isAdLoaded ? SizedBox(
      height: bannerAd.size.height.toDouble(),
      width: bannerAd.size.width.toDouble(),
      child: AdWidget(ad: bannerAd,),
    ):const SizedBox();
  }
}
