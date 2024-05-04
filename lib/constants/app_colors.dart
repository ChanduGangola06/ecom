// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  static const Color secondary = Color(0xFF440F09);
  static Color bottomUnslected = Colors.grey.shade400;
  static const Color primary = Color(0xFFe94c3c);
  static const Color accent = Color(0xFFf78373);
  static const Color darkBlue = Color(0xFF315D91);

  static const Color assentDark = Color(0xFF811B17);
  static const Color textColor = Color(0xFFffffff);
  static const Color backColor = Color(0xFFffffff);
  static const Color hintColor = Color(0xFF878787);
  static const Color buttonTopGradient = Color(0xFF811B17);
  static const Color sentColor = Color(0xFFC90000);
  static const Color receiveColor = Color(0xFF008409);
  static const Color buttonBottomGradient = Color(0xFF440F09);
  static const Color lightgreen = Color(0xFF9AC166);
  static const Color whitetransperent = Color(0x80FFFFFF);
  static const Color lightblue = Color(0xFF2AB2B3);
  static const Color listLightTextColor = Color(0xFF707070);
  static const Color dividerColor = Color(0xFFE3E9EC);
  static const Color secondLayer = Color(0xff9D8481);
  static const Color firstLayer = Color(0xff79524E);
  static const Color spinbutton = Color(0xffDDBD67);
  static const Color segcolor1 = Color(0xff93144b);
  static const Color segcolor2 = Color(0xff87a624);
  static const Color segcolor3 = Color(0xff443049);
  static const Color segcolor4 = Color(0xffe7882a);
  static const Color priceControl = Color(0xff39A70D);
  static const Color blackTransparent = Color(0x60000000);
  static const Color black75 = Color(0xB3000000);
  static const Color grayBorder = Color(0xB39A9999);
  static const Color grayText = Color(0xB36A6A6A);
  static const Color whiteTransparent = Color(0xBFFFFFFF);
  static const Color colorBack = Color(0xBFFCFCFC);
  static const Color bgColor = Color(0xBFf9f9f9);
  static const Color formborder = Color(0xFFCBCACA);
  static const Color toggele = Color(0xFFe8e8e8);

  static const Color accent2 = Color(0xFF30adff);
  static const Color primary2 = Color(0xFF166eff);
  static const Color grey2 = Color(0xFF585858);
  static const Color grayText2 = Color(0xB36A6A6A);
  static const Color formborder2 = Color(0xFFCBCACA);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFffffff);
  static const Color lightblue2 = Color(0xFFE8F3FF);
  static const Color secondary2 = Color(0xFF440F09);
  static const Color bgColor2 = Color(0xBFf9f9f9);
  static const Color whiteTransparent2 = Color(0xBFFFFFFF);
  static const Color priceControl2 = Color(0xff39A70D);
  static const Color blackTransparent2 = Color(0x60000000);
  static const Color textColor2 = Color(0xFFffffff);
  static const Color bottomUnslected2 = Color(0xFF999999);
  static const Color dividerColor2 = Color(0xFFE3E9EC);
  static const Color receiveColor2 = Color(0xFF008409);

  static const Color titlecardback = Colors.transparent;
  static Color grey = Colors.grey[400]!;

  static LinearGradient backGradient = LinearGradient(
      colors: [primary.withOpacity(0.3), accent.withOpacity(0.1)],
      end: Alignment.bottomRight,
      stops: [0.3, 0.9],
      begin: Alignment.topLeft);

  static LinearGradient backGradient1 = LinearGradient(
      colors: [
        white.withOpacity(0.5),
        white.withOpacity(0.7),
      ],
      end: Alignment.bottomRight,
      stops: [0.3, 0.9],
      begin: Alignment.topLeft);

  static LinearGradient bottonGradient = LinearGradient(
      colors: [Color.fromARGB(255, 232, 183, 177), white],
      end: Alignment.bottomRight,
      stops: [0.3, 0.9],
      begin: Alignment.topLeft);

  static const LinearGradient buttonGradient = LinearGradient(
      colors: [secondary, primary, accent],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient buttonGradient1 = LinearGradient(
      colors: [primary, accent],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient rateGradient1 = LinearGradient(colors: [
    white,
    formborder2,
  ], end: Alignment.topLeft, begin: Alignment.bottomRight);

  static LinearGradient offerGradient = LinearGradient(
      colors: [Colors.green.withOpacity(0.5), Colors.green],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient buttonGradient2 = LinearGradient(
      colors: [accent, primary],
      end: Alignment.topLeft,
      begin: Alignment.topRight);

  static const LinearGradient navItemsGradiant = LinearGradient(
      colors: [whiteTransparent, accent],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient trasparantGradiant = LinearGradient(
      colors: [Colors.transparent, Colors.transparent],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient bgGradient = LinearGradient(
      colors: [secondary, primary, accent],
      end: Alignment.bottomRight,
      begin: Alignment.topLeft);
  static const LinearGradient profileGradiant = LinearGradient(
      colors: [assentDark, secondary],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const LinearGradient buttonBg = LinearGradient(
      colors: [AppColors.buttonTopGradient, AppColors.buttonBottomGradient],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const LinearGradient spinGradient = LinearGradient(
      colors: [lightgreen, lightblue],
      end: Alignment.bottomCenter,
      begin: Alignment.topCenter);

  static const LinearGradient buttonGradient_ui2 = LinearGradient(
      colors: [primary2, accent2],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient newButtonGradient_ui2 = LinearGradient(
      colors: [primary, accent],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient buttonGradient21 = LinearGradient(
      colors: [accent2, primary2],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient trasparantGradiant2 = LinearGradient(
      colors: [Colors.transparent, Colors.transparent],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient navItemsGradiant2 = LinearGradient(
      colors: [primary2, accent2],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);

  static const LinearGradient appGrediant2 = LinearGradient(
      colors: [primary2, accent2],
      end: Alignment.topLeft,
      begin: Alignment.bottomRight);
}
