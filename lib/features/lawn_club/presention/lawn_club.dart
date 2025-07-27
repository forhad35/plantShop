import 'package:flutter/material.dart';
import 'package:plant_shop/constens/text_font_style.dart';
import 'package:plant_shop/features/lawn_club/data/slider_image.dart';
import 'package:plant_shop/features/lawn_club/presention/widget/all_product.dart';
import 'package:plant_shop/features/lawn_club/presention/widget/slider.dart';
import 'package:plant_shop/helper/onboard_controller.dart';

class LawnClub extends StatefulWidget {
  const LawnClub({super.key});

  @override
  State<LawnClub> createState() => _LawnClubState();
}

class _LawnClubState extends State<LawnClub> {
  final carouselController = OnboardController().instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderWidget(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF000000),
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.network(
                        profileImage,
                        width: 120,
                        height: 120,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: const Color.fromARGB(212, 236, 236, 236),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "235",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Followers",
                            style: TextFontStyle.textStyle12c000000Quicksand400,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,

                          color: const Color.fromARGB(212, 236, 236, 236),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "30",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Mins",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 16, color: Colors.green),
                              Text(
                                "4.6",
                                style:
                                    TextFontStyle
                                        .textStyle12c000000Quicksand500,
                              ),
                              Text(
                                "(39)",
                                style:
                                    TextFontStyle
                                        .textStyle12c000000Quicksand400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lawn Club",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "In the second BoxShadow widget the color assigned is white, and the offset is r assigned is white, and the offset is",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                  
                      Row(
                        children: [
                          SizedBox(
                            width: 170,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "Chat",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            width: 170,
                  
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(
                                "Follow",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  
                      SingleChildScrollView(
                        child: SizedBox(
                          height:302,
                          width: MediaQuery.sizeOf(context).width *0.9,
                          child: DefaultTabController(
                            length: 2,
                            child: SizedBox(
                          width: MediaQuery.sizeOf(context).width *0.9,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 400,
                                    child: TabBar(
                                      indicatorColor: Colors.red,
                                      labelColor: Colors.red,
                                      unselectedLabelColor: Colors.black,
                                      tabs: [
                                        Tab(text: "Available Today"),
                                        Tab(text: "Pre-order"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height: 300,
                                      width: MediaQuery.sizeOf(context).width *0.9,
                                      child: TabBarView(
                                      children: [
                                        AllProduct(),
                                        Center(child: Text("Content for Tab 2")),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
