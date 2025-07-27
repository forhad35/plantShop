import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  Rx<int> value = 0.obs;
  OnboardController get instance => Get.find();
  CarouselSliderController carouselController = CarouselSliderController();
  final PageController pageController = PageController();
  void onPageChange(value) {
    this.value.value = value;
  }
}
