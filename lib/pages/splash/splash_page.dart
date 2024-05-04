// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';
import 'dart:math';

import 'package:ecom/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class SpritePainter extends CustomPainter {
  final Animation<double>? _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 2.0);
    Color color = Color.fromRGBO(0, 102, 194, opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation!.value);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Timer timer;
  startTime() async {
    var _duration = const Duration(seconds: 6);
    timer = Timer(_duration, navigationPage);
    return timer;
  }

  @override
  void dispose() {
    timer.cancel();
    _controller!.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
    );

    _startAnimation();
    startTime();
  }

  void _startAnimation() {
    _controller!.stop();
    _controller!.reset();
    _controller!.repeat(
      period: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF30adff),
              Color(0xFF166eff),
            ],
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        child: Image.asset(
                          "assets/images3/2_splash_circle1.png",
                          height: 250.0,
                          width: 250.0,
                          scale: 1,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Image.asset(
                          "assets/images3/2_splash_circle1.png",
                          height: 215.0,
                          width: 215.0,
                          scale: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: SpritePainter(_controller),
                    child: const SizedBox(
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Image.asset(
                        "assets/svg3/logo_shopping.png",
                        height: 100.0,
                        width: 100.0,
                        scale: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
