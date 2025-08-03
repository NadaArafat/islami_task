import 'package:flutter/material.dart';
import 'package:islami_onboarding_task/utils/app_styles.dart';

import '../models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboarding});

  final OnboardingModel onboarding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset(onboarding.image)),
        Text(onboarding.title,style: AppStyles.bold24,textAlign: TextAlign.center,),
        Text(onboarding.subtitle?? '',style: AppStyles.bold20,textAlign: TextAlign.center,),
      ],
    );
  }
}
