import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../data/app_text_styles.dart';

class NewPasswordSuccessScreen extends StatefulWidget {
  const NewPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordSuccessScreen> createState() => _NewPasswordSuccessScreenState();
}

class _NewPasswordSuccessScreenState extends State<NewPasswordSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 68.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/newPasswordSuccess.png'),),
              SizedBox(
                height: height / 15,),
              Text(AppStrings.newPasswordCreated, style: AppTextStyles.s24w700l31),
              SizedBox(
                height: height / 40,
              ),
              Text(AppStrings.newPasswordCreatedText,textAlign: TextAlign.center, style: AppTextStyles.s14w400l21.copyWith(color: AppColors.subtitleColor)),


            ],
          ),
        ),
      )
    );
  }
}