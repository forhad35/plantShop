import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_shop/features/onboard/presention/widget/bold_last_word_text.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key, required this.title, required this.lottie});

  final String title;
  final String lottie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 200.h),
        Lottie.asset(lottie, width: double.infinity, height: 300.h),
        SizedBox(height: 20),
        SizedBox(width: 250.w, child: BoldLastWordText(text: title)),
      ],
    );
  }
}
