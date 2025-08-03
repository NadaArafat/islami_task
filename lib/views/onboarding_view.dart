import 'package:flutter/material.dart';
import 'package:islami_onboarding_task/models/onboarding_model.dart';
import 'package:islami_onboarding_task/utils/app_colors.dart';
import 'package:islami_onboarding_task/utils/app_styles.dart';
import 'package:islami_onboarding_task/widgets/onboarding_item.dart';

import '../generated/assets.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();

  int currentPage = 0;

  static const List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding1.png',
      title: 'Welcome To Islami App',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding2.png',
      title: 'Welcome To Islami',
      subtitle: 'We Are Very Excited To Have You In Our Community',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding3.png',
      title: 'Reading the Quran',
      subtitle: 'Read, and your Lord is the Most Generous',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding4.png',
      title: 'Bearish',
      subtitle: 'Praise the name of your Lord, the Most High',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding5.png',
      title: 'Holy Quran Radio',
      subtitle:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset(Assets.imagesIslamiLogo)),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return OnboardingItem(onboarding: pages[index]);
                  },
                ),
              ),
              Row(
                children: [
                  currentPage > 0
                      ? InkWell(
                        onTap: _moveBack,
                        child: Text('Back', style: AppStyles.bold16),
                      )
                      : SizedBox(),
                  Spacer(),
                  ...List.generate(
                    5,
                    (index) => _buildDots(active: index == currentPage),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: _moveForward,
                    child: Text(
                      currentPage < pages.length - 1 ? 'Next' : 'Finish',
                      style: AppStyles.bold16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDots({required bool active}) {
    return active ? activeDot() : inActiveDot();
  }

  Widget activeDot() {
    return Container(
      margin: EdgeInsets.only(right: 11),
      height: 7,
      width: 18,
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(27),
      ),
    );
  }

  Widget inActiveDot() {
    return Container(
      margin: EdgeInsets.only(right: 11),
      width: 7,
      height: 7,
      decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
    );
  }

  _moveForward() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(microseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (currentPage == pages.length - 1) {
      //todo: navigate to home page
    }
  }

  _moveBack() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: Duration(microseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
