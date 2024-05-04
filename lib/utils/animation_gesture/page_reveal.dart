import 'package:ecom/utils/circular_reveal_clipper.dart';
import 'package:flutter/material.dart';

class PageReveal extends StatelessWidget {
  final double? revealPercent;
  final Widget? child;

  //Constructor
  const PageReveal({super.key, this.revealPercent, this.child});

  @override
  Widget build(BuildContext context) {
    //ClipOval cuts the page to circular shape.
    return ClipOval(
      clipper: CircularRevealClipper(revealPercent: revealPercent),
      child: child,
    );
  }
}
