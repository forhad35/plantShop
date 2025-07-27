import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderDot extends StatelessWidget {
  const SliderDot({super.key, required this.index,required this.position});
  final int index;
  final double position;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200.h,
      left: 178.w,
      child:DotsIndicator(dotsCount: index,
      position: position,
      decorator: DotsDecorator(
        size: Size(6, 6),
        color: Colors.white,
        activeColor: Colors.red,
        spacing: EdgeInsets.all(2),
        activeSize: Size(6, 6),
      ),
      ),
    );
  }
}
