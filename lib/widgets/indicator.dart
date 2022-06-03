import 'package:flutter/material.dart';

import '../data/app_colors.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator(
      {Key? key, required this.currentIndex, required this.positionIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: positionIndex == currentIndex ? 32 : 6,
      decoration: BoxDecoration(
          color: positionIndex == currentIndex
              ? AppColors.primaryColor
              : AppColors.indicatorColor,
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
