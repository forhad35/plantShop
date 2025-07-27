import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardDot extends StatelessWidget {
  const OnboardDot({super.key, required this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: Colors.lightGreen,
          dotHeight: 6,
          dotWidth: 6,
        ),
        controller: controller,
        count: 3,
      ),
    );
  }
}
