import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late Size screenSize;
double defaultScreenWidth = 400.0;
double defaultScreenHeight = 810.0;

class Constants {
  static double screenWidth = defaultScreenWidth;
  static double screenHeight = defaultScreenHeight;

  static double size0_3 = 0.3;
  static double size0_5 = 0.5;
  static double size1 = 1.0;
  static double size1_5 = 1.5;
  static double size2 = 2.0;
  static double size3 = 3.0;
  static double size4 = 4.0;
  static double size5 = 5.0;
  static double size6 = 6.0;
  static double size8 = 8.0;
  static double size10 = 10.0;
  static double size12 = 12.0;
  static double size13 = 13.0;
  static double size14 = 14.0;
  static double size15 = 15.0;
  static double size16 = 16.0;
  static double size18 = 18.0;
  static double size20 = 20.0;
  static double size24 = 24.0;
  static double size28 = 28.0;
  static double size30 = 30.0;
  static double size32 = 32.0;
  static double size36 = 36.0;
  static double size40 = 40.0;
  static double size44 = 44.0;
  static double size50 = 50.0;
  static double size48 = 48.0;
  static double size56 = 56.0;
  static double size60 = 60.0;
  static double size64 = 64.0;
  static double size70 = 70.0;
  static double size72 = 72.0;
  static double size75 = 75.0;
  static double size80 = 80.0;
  static double size88 = 88.0;
  static double size95 = 95.0;
  static double size85 = 85.0;
  static double size90 = 90.0;
  static double size100 = 100.0;
  static double size110 = 110.0;
  static double size120 = 120.0;
  static double size130 = 130.0;
  static double size140 = 140.0;
  static double size150 = 150.0;
  static double size160 = 160.0;
  static double size164 = 164.0;
  static double size180 = 180.0;
  static double size170 = 170.0;
  static double size185 = 185.0;
  static double size190 = 190.0;
  static double size200 = 200.0;
  static double size205 = 205.0;
  static double size210 = 210.0;
  static double size220 = 220.0;
  static double size230 = 230.0;
  static double size240 = 240.0;
  static double size250 = 250.0;
  static double size260 = 260.0;
  static double size280 = 280.0;
  static double size300 = 300.0;
  static double size310 = 310.0;
  static double size320 = 320.0;

  static double size340 = 340.0;
  static double size350 = 350.0;
  static double size360 = 360.0;
  static double size380 = 380.0;
  static double size400 = 400.0;
  static double size328 = 328.0;

  static double screenWidthButton = screenWidth - size64;
  static double screenWidthHalf = screenWidth / 2;
  static double screenWidthThird = screenWidth / 3;
  static double screenWidthFourth = screenWidth / 4;
  static double screenWidthFifth = screenWidth / 5;
  static double screenWidthSixth = screenWidth / 6;
  static double screenWidthTenth = screenWidth / 10;

  /*Image Dimensions*/

  static double defaultIconSize = 80.0;
  static double defaultImageHeight = 120.0;
  static double snackBarHeight = 50.0;
  static double texIconSize = 30.0;

  /*Default Height&Width*/
  static double defaultIndicatorHeight = 5.0;
  static double defaultIndicatorWidth = screenWidthFourth;

  /*EdgeInsets*/
  static EdgeInsets spacingAllDefault = EdgeInsets.all(size8);
  static EdgeInsets spacingAllSmall = EdgeInsets.all(size12);

  static void setDefaultSize(context) {
    screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;

    size24 = 20.0;
    size32 = 30.0;
    size44 = 40.0;
    size56 = 50.0;

    screenWidthHalf = screenWidth / 2;
    screenWidthThird = screenWidth / 3;
    screenWidthFourth = screenWidth / 4;
    screenWidthFifth = screenWidth / 5;
    screenWidthSixth = screenWidth / 6;
    screenWidthTenth = screenWidth / 10;

    defaultIconSize = 80.0;
    defaultImageHeight = 120.0;
    snackBarHeight = 50.0;
    texIconSize = 30.0;

    defaultIndicatorHeight = 5.0;
    defaultIndicatorWidth = screenWidthFourth;

    spacingAllDefault = EdgeInsets.all(size8);
    spacingAllSmall = EdgeInsets.all(size12);

    FontSize.setDefaultFontSize();
  }

  static void setScreenAwareConstant(context) {
    ScreenUtil.init(context,
        designSize: Size(defaultScreenWidth, defaultScreenHeight));

    FontSize.setScreenAwareFontSize();
    screenWidth = ScreenUtil().screenWidth;
    screenHeight = ScreenUtil().screenHeight;
    /*Padding & Margin Constants*/

    size0_3 = ScreenUtil().setWidth(0.3);
    size0_5 = ScreenUtil().setWidth(0.5);
    size1 = ScreenUtil().setWidth(1.0);
    size1_5 = ScreenUtil().setWidth(1.5);
    size3 = ScreenUtil().setWidth(3.0);
    size2 = ScreenUtil().setWidth(2.0);
    size4 = ScreenUtil().setWidth(4.0);
    size5 = ScreenUtil().setWidth(5.0);
    size6 = ScreenUtil().setWidth(6.0);
    size8 = ScreenUtil().setWidth(8.0);
    size10 = ScreenUtil().setWidth(10.0);
    size12 = ScreenUtil().setWidth(12.0);
    size13 = ScreenUtil().setWidth(13.0);
    size14 = ScreenUtil().setWidth(14.0);
    size15 = ScreenUtil().setWidth(15.0);
    size16 = ScreenUtil().setWidth(16.0);
    size18 = ScreenUtil().setWidth(18.0);
    size20 = ScreenUtil().setWidth(20.0);
    size24 = ScreenUtil().setWidth(24.0);
    size28 = ScreenUtil().setWidth(28.0);
    size30 = ScreenUtil().setWidth(30.0);
    size32 = ScreenUtil().setWidth(32.0);
    size40 = ScreenUtil().setWidth(40.0);
    size36 = ScreenUtil().setWidth(36.0);
    size36 = ScreenUtil().setWidth(36.0);
    size40 = ScreenUtil().setWidth(40.0);
    size44 = ScreenUtil().setWidth(44.0);
    size50 = ScreenUtil().setWidth(50.0);
    size48 = ScreenUtil().setWidth(48.0);
    size56 = ScreenUtil().setWidth(56.0);
    size60 = ScreenUtil().setWidth(60.0);
    size64 = ScreenUtil().setWidth(64.0);
    size70 = ScreenUtil().setWidth(70.0);
    size72 = ScreenUtil().setWidth(72.0);
    size75 = ScreenUtil().setWidth(75.0);
    size80 = ScreenUtil().setWidth(80.0);
    size85 = ScreenUtil().setWidth(85.0);
    size88 = ScreenUtil().setWidth(88.0);
    size95 = ScreenUtil().setWidth(95.0);
    size100 = ScreenUtil().setWidth(100.0);
    size110 = ScreenUtil().setWidth(110.0);
    size120 = ScreenUtil().setWidth(120.0);
    size130 = ScreenUtil().setWidth(130.0);
    size140 = ScreenUtil().setWidth(140.0);
    size150 = ScreenUtil().setWidth(150.0);
    size160 = ScreenUtil().setWidth(160.0);
    size164 = ScreenUtil().setWidth(164.0);
    size170 = ScreenUtil().setWidth(170.0);
    size180 = ScreenUtil().setWidth(180.0);
    size185 = ScreenUtil().setWidth(185.0);
    size190 = ScreenUtil().setWidth(190.0);
    size200 = ScreenUtil().setWidth(200.0);
    size250 = ScreenUtil().setWidth(250.0);
    size205 = ScreenUtil().setWidth(205.0);
    size210 = ScreenUtil().setWidth(210.0);
    size220 = ScreenUtil().setWidth(220.0);
    size230 = ScreenUtil().setWidth(230.0);
    size240 = ScreenUtil().setWidth(240.0);
    size260 = ScreenUtil().setWidth(260.0);
    size280 = ScreenUtil().setWidth(280.0);
    size300 = ScreenUtil().setWidth(300.0);
    size310 = ScreenUtil().setWidth(310.0);
    size320 = ScreenUtil().setWidth(320.0);
    size340 = ScreenUtil().setWidth(340.0);
    size350 = ScreenUtil().setWidth(350.0);
    size360 = ScreenUtil().setWidth(360.0);
    size380 = ScreenUtil().setWidth(380.0);
    size400 = ScreenUtil().setWidth(400.0);
    size328 = ScreenUtil().setWidth(328.0);

    /*EdgeInsets*/

    spacingAllDefault = EdgeInsets.all(size8);
    spacingAllSmall = EdgeInsets.all(size12);

    /*Screen Size dependent Constants*/
    screenWidthHalf = ScreenUtil().screenWidth / 2;
    screenWidthThird = ScreenUtil().screenWidth / 3;
    screenWidthFourth = ScreenUtil().screenWidth / 4;
    screenWidthFifth = ScreenUtil().screenWidth / 5;
    screenWidthSixth = ScreenUtil().screenWidth / 6;
    screenWidthTenth = ScreenUtil().screenWidth / 10;

    /*Image Dimensions*/

    defaultIconSize = ScreenUtil().setWidth(80.0);
    defaultImageHeight = ScreenUtil().setHeight(120.0);
    snackBarHeight = ScreenUtil().setHeight(50.0);
    texIconSize = ScreenUtil().setWidth(30.0);

    /*Default Height&Width*/
    defaultIndicatorHeight = ScreenUtil().setHeight(5.0);
    defaultIndicatorWidth = screenWidthFourth;
  }
}

class FontSize {
  static double s7 = 7.0;
  static double s8 = 8.0;
  static double s9 = 9.0;
  static double s10 = 10.0;
  static double s11 = 11.0;
  static double s12 = 12.0;
  static double s13 = 13.0;
  static double s14 = 14.0;
  static double s15 = 15.0;
  static double s16 = 16.0;
  static double s17 = 17.0;
  static double s18 = 18.0;
  static double s19 = 19.0;
  static double s20 = 20.0;
  static double s21 = 21.0;
  static double s22 = 22.0;
  static double s23 = 23.0;
  static double s24 = 24.0;
  static double s25 = 25.0;
  static double s26 = 26.0;
  static double s27 = 27.0;
  static double s28 = 28.0;
  static double s29 = 29.0;
  static double s30 = 30.0;
  static double s36 = 36.0;
  static double s42 = 42.0;
  static double s48 = 48.0;

  static setDefaultFontSize() {
    s7 = 7.0;
    s8 = 8.0;
    s9 = 9.0;
    s10 = 10.0;
    s11 = 11.0;
    s12 = 12.0;
    s13 = 13.0;
    s14 = 14.0;
    s15 = 15.0;
    s16 = 16.0;
    s17 = 17.0;
    s18 = 18.0;
    s19 = 19.0;
    s20 = 20.0;
    s21 = 21.0;
    s22 = 22.0;
    s23 = 23.0;
    s24 = 24.0;
    s25 = 25.0;
    s26 = 26.0;
    s27 = 27.0;
    s28 = 28.0;
    s29 = 29.0;
    s30 = 30.0;
    s36 = 36.0;
    s42 = 42.0;
    s48 = 48.0;
  }

  static setScreenAwareFontSize() {
    s7 = ScreenUtil().setSp(7.0);
    s8 = ScreenUtil().setSp(8.0);
    s9 = ScreenUtil().setSp(9.0);
    s10 = ScreenUtil().setSp(10.0);
    s11 = ScreenUtil().setSp(11.0);
    s12 = ScreenUtil().setSp(12.0);
    s13 = ScreenUtil().setSp(13.0);
    s14 = ScreenUtil().setSp(14.0);
    s15 = ScreenUtil().setSp(15.0);
    s16 = ScreenUtil().setSp(16.0);
    s17 = ScreenUtil().setSp(17.0);
    s18 = ScreenUtil().setSp(18.0);
    s19 = ScreenUtil().setSp(19.0);
    s20 = ScreenUtil().setSp(20.0);
    s21 = ScreenUtil().setSp(21.0);
    s22 = ScreenUtil().setSp(22.0);
    s23 = ScreenUtil().setSp(23.0);
    s24 = ScreenUtil().setSp(24.0);
    s25 = ScreenUtil().setSp(25.0);
    s26 = ScreenUtil().setSp(26.0);
    s27 = ScreenUtil().setSp(27.0);
    s28 = ScreenUtil().setSp(28.0);
    s29 = ScreenUtil().setSp(29.0);
    s30 = ScreenUtil().setSp(30.0);
    s36 = ScreenUtil().setSp(36.0);
    s42 = ScreenUtil().setSp(42.0);
    s48 = ScreenUtil().setSp(48.0);
  }
}
