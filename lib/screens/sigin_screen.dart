import 'package:flutter/material.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../data/app_text_styles.dart';
import '../widgets/app_progress_indicator.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
    final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordObscured=true;
  final TextEditingController _emailTextEditingController =
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
                  child: Text(AppStrings.hiThere, style: AppTextStyles.s24w700l31)),
                SizedBox(
                  height: height / 40,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(AppStrings.signinText, style: AppTextStyles.s16w400l24.copyWith(color: AppColors.subtitleColor)),),
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
                        height: height / 25,
                      ),
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
                        height: height / 30,
                      ),
                      Text(AppStrings.forgotPassword, 
                      style: AppTextStyles.s16w700l24.copyWith(color: AppColors.secondaryColor)),
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
                                            padding: const EdgeInsets.symmetric(vertical: 15.0),child: Text(AppStrings.signIn,style: AppTextStyles.s16w700l24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height/15),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                          width: 200,
                          height: 0.5,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: <Color>[AppColors.subtitleColor, Colors.transparent]),
                            ),
                          ),
                        ),),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(AppStrings.or,
                        style: AppTextStyles.s14w400l21.copyWith(color: AppColors.subtitleColor),),
                      ),
                    Expanded(
                        child: SizedBox(
                          width: 200,
                          height: 0.5,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: <Color>[AppColors.subtitleColor, Colors.transparent]),
                            ),
                          ),
                        ),),
                  ],
                ),
                SizedBox(
                  height: height / 25,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8))),
                        child: TextButton(
                          onPressed: (){},
                          child:  const Padding(
                            padding: EdgeInsets.symmetric(vertical:8.0),
                            child: Image( image: AssetImage('assets/images/google.png')),
                          ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(color: AppColors.greyColor))),
                    ),
                        ),
                      ),
                    ),
                    SizedBox(width: width*0.04,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8))),
                        child: TextButton(
                          onPressed: (){},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical:5.0),
                            child: Icon(Icons.apple, size: 30,color: AppColors.black,),
                          ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(AppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(color: AppColors.greyColor))),
                    ),
                      ),
                    ),),
                
                  ],
                ),
              ],
            ),
          ),
        ),bottomSheet:Padding(
          padding: const EdgeInsets.only(bottom:20.0),
          child: Container(width: width,
            child: GestureDetector(
              onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                      (Route<dynamic> route) => false);
              },
              child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.dontHaveAccountText,
                          style: AppTextStyles.s16w400l24
                              .copyWith(color: AppColors.subtitleColor),
                        ),
                        TextSpan(
                          text: ' '+AppStrings.signUp,
                          style: AppTextStyles.s16w700l24
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
