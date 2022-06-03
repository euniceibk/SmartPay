import 'package:flutter/material.dart';

import '../data/app_colors.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 25,
        width: 25,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
