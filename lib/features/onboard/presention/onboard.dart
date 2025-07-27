import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_shop/features/audio_player/presention/audio_player.dart';
import 'package:plant_shop/features/lawn_club/presention/lawn_club.dart';
import 'package:plant_shop/features/onboard/presention/widget/onboard_dot.dart';
import 'package:plant_shop/features/onboard/presention/widget/onboard_page.dart';
import 'package:plant_shop/gen/assets.gen.dart';
import 'package:plant_shop/helper/onboard_controller.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});
  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final controller = Get.put(OnboardController());
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChange,

              children: [
                OnboardPage(
                  lottie: $AssetsLottieGen().lottie1,
                  title: "Enjoy Your \nLife With Planets",
                ),
                OnboardPage(
                  lottie: $AssetsLottieGen().lottie2,
                  title: "Greener with \nEvery Tap..",
                ),
                OnboardPage(
                  lottie: $AssetsLottieGen().lottie,
                  title: "Leef by Leef, \nGrow Smart.",
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.58,
              left: MediaQuery.sizeOf(context).width / 2 - 30,
              child: OnboardDot(controller: controller.pageController),
            ),

            Obx(
              () => Positioned(
                left: MediaQuery.sizeOf(context).width / 2 - 50,
                bottom: 60,
                child:
                    controller.value.value == 2
                        ? Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightGreen,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                    ),
                                    onPressed: nextPage,
                                    child: Transform.translate(
                                      offset: Offset(-5, 0),
                                      child: Icon(Icons.arrow_back, size: 15),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Text("Singup"),
                                ),
                              ],
                            ),
                          ],
                        )
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          onPressed: nextPage,
                          child: SizedBox(
                            height: 80,
                            width: 50,
                            child: Icon(Icons.arrow_forward, size: 50),
                          ),
                        ),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: TextButton(
                onPressed: skipPage,
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    if (controller.value.value < 1) {
      controller.value.value++;
      controller.pageController.jumpToPage(controller.value.value);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LawnClub()),
      );
    }
  }

  void skipPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
    );
  }
}
