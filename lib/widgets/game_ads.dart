import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameAds extends StatefulWidget {
  @override
  _GameAdsState createState() => _GameAdsState();
}

class _GameAdsState extends State<GameAds> {
  BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId:
          'ca-app-pub-7065714443867225/6797140156', // BannerAd.testAdUnitId,
      //   adUnitId: BannerAd.testAdUnitId,
      listener: AdListener(),
      request: AdRequest(),
    );
    _bannerAd..load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final AdWidget adWidget = AdWidget(ad: _bannerAd);
    return SizedBox(height: 50, child: AdWidget(ad: _bannerAd));
  }
}
