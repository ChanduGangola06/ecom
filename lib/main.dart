// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:ecom/constants/app_colors.dart';
import 'package:ecom/pages/splash/intro_page.dart';
import 'package:ecom/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

int counter = 0;
const int FinalAdCounter = 10;
bool isAdshow = true;
bool islive = false;
bool isOpenBoth = true;
bool isOpenFirstShoppingUIOne = true;
bool isOpenOnlyOneOrTwo = true;
bool isAdLoad = false;

//Banner placementID
String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return islive
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/6300978111';
  } else {
    return islive
        ? 'ca-app-pub-6341099809785071/7281897251'
        : 'ca-app-pub-3940256099942544/6300978111';
  }
}

//Banner Interstitial
String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return islive
        ? 'ca-app-pub-3940256099942544/1033173712'
        : 'ca-app-pub-3940256099942544/1033173712';
  } else {
    return islive
        ? 'ca-app-pub-6341099809785071/8403407239'
        : 'ca-app-pub-3940256099942544/1033173712';
  }
}

InterstitialAd? interstitialAd;
int numInterstitialLoadAttempts = 0;
const int maxFailedLoadAttempts = 3;

const AdRequest request = AdRequest(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  nonPersonalizedAds: true,
);

BannerAd? bannerAd;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MaterialApp(
      title: 'Ecom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      home: isOpenBoth
          ? (isOpenFirstShoppingUIOne ? IntroPage() : SplashPage())
          : isOpenOnlyOneOrTwo
              ? IntroPage()
              : SplashPage2(),
    );
  }
}

createBannerAd(Function refresh) {
  BannerAd(
    adUnitId: getBannerAdUnitId(),
    request: AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
      onAdLoaded: (ad) {
        isAdLoad = true;
        refresh.call();
        bannerAd = ad as BannerAd;
        print('print load ads');
      },
      onAdFailedToLoad: (ad, err) {
        isAdLoad = false;
        refresh.call();
        print('Failed to load a banner ad: ${err.message}');
        ad.dispose();
      },
    ),
  ).load();
}

void createInterstitialAd() {
  InterstitialAd.load(
      adUnitId: getInterstitialAdUnitId(),
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          interstitialAd = ad;
          numInterstitialLoadAttempts = 0;
          interstitialAd!.setImmersiveMode(true);
          showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          interstitialAd!..show();
          numInterstitialLoadAttempts += 1;
          interstitialAd = null;
          if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ));
}

void showInterstitialAd() {
  if (interstitialAd == null) {
    print('Warning: attempt to show interstitial before loaded.');
    return;
  }
  interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (InterstitialAd ad) =>
        print('ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (InterstitialAd ad) {
      print('$ad onAdDismissedFullScreenContent.');
      ad.dispose();
    },
    onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      createInterstitialAd();
    },
  );
  interstitialAd!.show();
  interstitialAd = null;
}
