import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../data/app_text_styles.dart';
import '../widgets/app_progress_indicator.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
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
                  child: Text(AppStrings.verifyTitle, style: AppTextStyles.s24w700l31)),
                  SizedBox(
                  height: height / 40,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppStrings.codeVerificationText, style: AppTextStyles.s16w400l24.copyWith(color: AppColors.subtitleColor)),),
                SizedBox(
                  height: height / 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: PinCodeTextField(
                          textStyle: AppTextStyles.s24w700l31.copyWith(
                            color: AppColors.primaryColor,
                          ),
                          length: 5,
                          obscureText: false,
                          appContext: context,
                          animationType: AnimationType.fade,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          keyboardType: TextInputType.number,
                          autoFocus: true,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: height / 10,
                            fieldWidth: width / 6,
                            borderWidth: 1.0,
                            activeColor: AppColors.textfieldColor,
                            activeFillColor: AppColors.textfieldColor,
                            inactiveColor: AppColors.textfieldColor,
                            selectedColor: AppColors.secondaryColor,
                            selectedFillColor: AppColors.textfieldColor,
                            inactiveFillColor: AppColors.textfieldColor,
                          ),
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          enablePinAutofill: true,
                          onSubmitted: (v) {
                            setState(() {
                            });
                          },
                          onCompleted: (value) {
                            setState(() {
                            });
                          },
                          onChanged: (String value) {},
                          //backgroundColor: Theme.of(context).canvasColor,
                        ),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Text(AppStrings.resendCode, textAlign: TextAlign.center,
                      style: AppTextStyles.s16w700l24.copyWith(color: AppColors.secondaryColor)),
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
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),child: Text(AppStrings.confirm,style: AppTextStyles.s16w700l24,
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
