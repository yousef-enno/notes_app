import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.03),
      borderRadius: BorderRadius.circular(16)
      ),
      child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            size: 28,
          )),
    );
  }
}
