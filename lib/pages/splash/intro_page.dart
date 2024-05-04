import 'package:ecom/utils/models/page_view_model.dart';
import 'package:ecom/pages/auth/login_page.dart';
import 'package:ecom/pages/splash/widgets/intro_view.dart';
import 'package:ecom/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final pages = [
    PageViewModel(
      pageBg: "assets/images/style.png",
      body: const Text(
        'Shop the most morden essentials',
      ),
      title: const Text('Shopping'),
      titleTextStyle: const TextStyle(
        fontFamily: 'MyFont',
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
          fontFamily: 'MyFont', color: Colors.white, fontSize: FontSize.s15),
    ),
    PageViewModel(
      pageBg: "assets/images/style1.png",
      body: const Text(
        'Personalise your shopping experience by following top brands.',
      ),
      title: const Text('Shop your favorites'),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(
          fontFamily: 'MyFont', color: Colors.white, fontSize: FontSize.s15),
    ),
    PageViewModel(
      pageBg: "assets/images/style2.png",
      body: const Text(
        'Shop from thousand of brands in the world, with one application at lowest prices.',
      ),
      title: const Text('Brands'),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(
          fontFamily: 'MyFont', color: Colors.white, fontSize: FontSize.s15),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => IntroView(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapSkipButton: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (route) => false, //MaterialPageRoute
          ),
          onTapDoneButton: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ), //MaterialPageRoute
          ),
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: FontSize.s14,
          ),
        ), //IntroViewsFlutter
      ),
    ); //Material App
  }
}
