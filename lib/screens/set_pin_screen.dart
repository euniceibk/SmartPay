import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../data/app_text_styles.dart';
import '../widgets/app_progress_indicator.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
    final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordObscured=true;
  final TextEditingController _comfirmPasswordTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
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
                  child: Text(AppStrings.setPinCode, style: AppTextStyles.s24w700l31)),
                SizedBox(
                  height: height / 40,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppStrings.setPinCodeText, style: AppTextStyles.s16w400l24.copyWith(color: AppColors.subtitleColor)),),
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
                            shape: PinCodeFieldShape.underline,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: height / 10,
                            fieldWidth: width / 6,
                            borderWidth: 1.0,
                            activeColor: Colors.transparent,
                            activeFillColor: Colors.transparent,
                            inactiveColor: Colors.transparent,
                            selectedColor: AppColors.secondaryColor,
                            selectedFillColor: Colors.transparent,
                            inactiveFillColor: Colors.transparent,
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
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),child: Text(AppStrings.createPin,style: AppTextStyles.s16w700l24,
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
