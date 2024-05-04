import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class PageViewModel {
  final Color? pageColor;

  final String? pageBg;

  final String? iconImageAssetPath;

  final Color? iconColor;

  final Color bubbleBackgroundColor;

  final Widget title;

  final Widget body;

  final TextStyle? textStyle;

  final TextStyle? titleTextStyle;

  final TextStyle? bodyTextStyle;

  final Widget? mainImage;

  final Widget? bubble;

  PageViewModel(
      {this.pageColor,
      this.pageBg,
      this.iconImageAssetPath,
      this.bubbleBackgroundColor = const Color(0x88FFFFFF),
      this.iconColor,
      required this.title,
      required this.body,
      this.mainImage,
      this.bubble,
      this.textStyle,
      this.titleTextStyle,
      this.bodyTextStyle});

  TextStyle get mergedTitleTextStyle {
    return TextStyle(
            color: Colors.white,
            fontSize: FontSize.s30,
            fontWeight: FontWeight.w400)
        .merge(textStyle)
        .merge(titleTextStyle);
  }

  TextStyle get mergedBodyTextStyle {
    return TextStyle(
            color: Colors.white,
            fontSize: FontSize.s21,
            fontWeight: FontWeight.w400)
        .merge(textStyle)
        .merge(bodyTextStyle);
  }
}
