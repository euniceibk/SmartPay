import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../data/app_text_styles.dart';
import '../widgets/app_progress_indicator.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
                  child: Text(AppStrings.createNewPassword, style: AppTextStyles.s24w700l31)),
                SizedBox(
                  height: height / 40,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppStrings.newPasswordText, style: AppTextStyles.s16w400l24.copyWith(color: AppColors.subtitleColor)),),
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
                        controller: _passwordTextEditingController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPasswordObscured,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textfieldColor,
                          labelText: AppStrings.password,
                          labelStyle: AppTextStyles.s16w400l24
                              .copyWith(color: AppColors.placeholderColor),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              isPasswordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                              color: AppColors.subtitleColor,
                              ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                  isPasswordObscured = !isPasswordObscured;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondaryColor,
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
                            return AppStrings.passwordErrorText;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height / 25,
                      ),
                      TextFormField(
                        cursorColor: AppColors.primaryColor,
                        controller: _comfirmPasswordTextEditingController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPasswordObscured,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.textfieldColor,
                          labelText: AppStrings.confirmPassword,
                          labelStyle: AppTextStyles.s16w400l24
                              .copyWith(color: AppColors.placeholderColor),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              isPasswordObscured
                              ? Icons.visibility_off
                              : Icons.visibility,
                              color: AppColors.subtitleColor,
                              ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                  isPasswordObscured = !isPasswordObscured;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.secondaryColor,
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
                            return AppStrings.passwordErrorText;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height / 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet:  Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(width: width,
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
                                              onPressed: () async {
                                              },
                                              child:   isLoading ? const AppProgressIndicator() :  Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 15.0),child: Text(AppStrings.createNewPassword,style: AppTextStyles.s16w700l24,
                              ),
                            ),
                          ),
          ),
        ),
      ),
    );
  }
}
