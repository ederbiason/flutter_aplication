
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final double height;
  final Function()? onTap;

  const SquareTile({super.key, required this.imagePath, required this.height, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Image.asset(
          imagePath,
          height: height,
        ),
      ),
    );
  }
}