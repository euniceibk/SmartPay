import 'package:flutter/material.dart';
import 'package:smart_pay_app/data/app_strings.dart';
import 'package:smart_pay_app/data/app_text_styles.dart';

import '../data/app_colors.dart';
import 'button_widget.dart';
import 'indicator.dart';

// This class represents an on boarding page
class OnboardingScreenItem extends StatelessWidget {
  final String assetName;
  final String assetNameBottom;
  final String onboardTitle;
  final String onboardSubtitle;
  final int index;
  final double position;
  final Function() onPressedFunction;

  const OnboardingScreenItem({
    Key? key,
    required this.assetName,
    required this.onboardTitle,
    required this.onboardSubtitle,
    required this.assetNameBottom,
    required this.index,
    required this.onPressedFunction, required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              assetName,
              width: width,
            ),
          ), // Back image
          Positioned(
            top: position,
            child: Image.asset(
              assetNameBottom,
              width: width,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     SizedBox(
                      height: height * 0.03,
                    ),
                    Text(onboardTitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s24w700l31
                            .copyWith(color: AppColors.primaryColor)),
                    SizedBox(height: height*0.02),
                    Text(onboardSubtitle,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.s14w400l21
                            .copyWith(color: AppColors.subtitleColor)),
                    SizedBox(height: height*0.03),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Indicator(
                          positionIndex: 0,
                          currentIndex: index,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Indicator(
                          positionIndex: 1,
                          currentIndex: index,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height*0.03,
                    ),
                    ButtonWidget(
                        onPressedFunction: onPressedFunction,
                        buttonText: AppStrings.getStarted),
                    SizedBox(
                      height: height*0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Front image
        ],
      ),
    );
  }
}
