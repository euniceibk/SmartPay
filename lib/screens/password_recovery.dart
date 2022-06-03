import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../data/app_text_styles.dart';
import '../widgets/app_progress_indicator.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
    final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: height,
              ),
            child: Column(mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    child: const Icon(Icons.chevron_left, color: AppColors.primaryColor,size: 30,),
                    style: ButtonStyle(minimumSize: MaterialStateProperty.all(const Size.square(40)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(color: AppColors.greyColor))),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.passwordRecovery, style: AppTextStyles.s24w700l31)),
                  SizedBox(
                  height: height / 40,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppStrings.passwordRecoveryText, style: AppTextStyles.s16w400l24.copyWith(color: AppColors.subtitleColor)),),
                SizedBox(
                  height: height / 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        cursorColor: AppColors.primaryColor,
                        autofocus: true,
                        controller: _emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textfieldColor,
                          labelText: AppStrings.email,
                          labelStyle: AppTextStyles.s16w400l24
                              .copyWith(color: AppColors.placeholderColor),
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondaryColor
                                ,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(16.0))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(16.0))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondaryColor,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(16.0))),
                        ),
                        style: AppTextStyles.s16w400l24,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.emailErrorText;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height / 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.primaryColor),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                  side: const BorderSide(color: AppColors.primaryColor))),
                        ),
                                          onPressed: () async {
                                          },
                                          child:   isLoading ? const AppProgressIndicator() :  Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),child: Text(AppStrings.sendVerificationCode,style: AppTextStyles.s16w700l24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height/15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
