import 'package:flutter/material.dart';
import 'package:smart_pay_app/data/app_text_styles.dart';
import 'package:smart_pay_app/screens/sigin_screen.dart';
import 'package:smart_pay_app/widgets/button_widget.dart';

import '../data/app_colors.dart';
import '../data/app_strings.dart';
import '../widgets/indicator.dart';
import '../widgets/onboarding_screen_item.dart';

// This class holds the information to be displayed in each of the
// on boarding screens

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onChangedFunction(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  void _navigateToSignInScreen() {
    // pushAndRemoveUntil is used here, to clear the entire Navigation stack after onboarding
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  bool isCurrentPageLast() {
    bool isCurrentPageLast = currentIndex == 1;

    return isCurrentPageLast;
  }

  void handleButtonTap() {
    if (isCurrentPageLast()) {
      _navigateToSignInScreen();
    } else {
      int nextPage = currentIndex + 1;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void handlePageSwipe({required int newIndex}) => onChangedFunction(newIndex);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                      isCurrentPageLast() ? AppStrings.done : AppStrings.skip, style: AppTextStyles.s16w700l24,),
                  onPressed: _navigateToSignInScreen,
                  style: ButtonStyle(                    
                    foregroundColor: MaterialStateProperty.all<Color>(AppColors.secondaryColor400),
                    ),
                ),
              ),
               SizedBox(
                height:height * 0.065,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        onPageChanged: (int i) {
                          handlePageSwipe(newIndex: i);
                        },
                        controller: _pageController,
                        children:  <Widget>[
                          OnboardingScreenItem(
                              assetName: 'assets/images/device.png',
                              assetNameBottom: 'assets/images/illustration1.png',
                              position: height * 0.037,
                              onboardTitle: AppStrings.onBoardingTitleText1,
                              onboardSubtitle:
                                  AppStrings.onBoardingSubtitleText1, index: currentIndex, onPressedFunction: _navigateToSignInScreen,),
                          OnboardingScreenItem(
                              assetName: 'assets/images/onboard2.png',
                              assetNameBottom: 'assets/images/illustration2.png',
                              position: height * 0.155,
                              onboardTitle: AppStrings.onBoardingTitleText2,
                              onboardSubtitle:
                                  AppStrings.onBoardingSubtitleText2, index: currentIndex, onPressedFunction: _navigateToSignInScreen,),
                        ],
                      ),
                    ),      
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


