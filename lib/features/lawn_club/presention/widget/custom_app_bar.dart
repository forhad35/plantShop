import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 0,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        width: MediaQuery.sizeOf(context).width - 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back, color: Colors.white),
            Text(
              "Lown Club",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.more_vert, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
