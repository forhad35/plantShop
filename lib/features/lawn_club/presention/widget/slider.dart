import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/features/lawn_club/data/slider_image.dart';
import 'package:plant_shop/features/lawn_club/presention/widget/custom_app_bar.dart';
import 'package:plant_shop/features/lawn_club/presention/widget/slider_dot.dart';

// ignore: must_be_immutable
class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double slidderPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
              onPageChanged:
                  (index, reason) => setState(() {
                    slidderPosition = index.toDouble();
                  }),
            ),
            itemBuilder:
                (BuildContext context, int index, int pageViewIndex) =>
                    Image.network(
                      images[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 300,
                    ),
          ),
        ),
        SliderDot(index: images.length, position: slidderPosition),
        CustomAppBar(),
      ],
    );
  }
}
