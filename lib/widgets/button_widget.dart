import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressedFunction;
  final String buttonText;

  const ButtonWidget(
      {Key? key, required this.onPressedFunction, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  side: const BorderSide(color: AppColors.primaryColor))),
        ),
        onPressed: onPressedFunction,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            buttonText,
            style: AppTextStyles.s16w700l24,
          ),
        ),
      ),
    );
  }
}
