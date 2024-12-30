import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

     
class BannerAdHelper {
  static final BannerAdHelper _instance = BannerAdHelper._internal();
  late BannerAd bannerAd;
  final String adUnitIdAndroid = "ca-app-pub-9865552746702280/8416701200";
  final String adUnitIdIOS = "ca-app-pub-9865552746702280/8314691054";
  bool isBannerAd = false;

  factory BannerAdHelper() {
    return _instance;
  }

  AdWidget buildAdWidget() {
    return AdWidget(ad: bannerAd);
  }

  BannerAdHelper._internal();

  void initializeAdMob({required void Function(Ad)? onAdLoaded}) {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: Platform.isAndroid ? adUnitIdAndroid : adUnitIdIOS,
      listener: BannerAdListener(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
       
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }
}
