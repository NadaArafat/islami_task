import 'package:flutter/material.dart';
import 'package:islami_onboarding_task/utils/app_colors.dart';
import 'package:islami_onboarding_task/utils/app_styles.dart';
import 'package:islami_onboarding_task/widgets/second_sebha.dart';

import '../generated/assets.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.imagesSebhaBg, fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.black.withAlpha(178), AppColors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
              child: Column(
                children: [
                  Center(child: Image.asset(Assets.imagesIslamiLogo)),
                  Text(
                    'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
                    style: AppStyles.arBold36,
                  ),
                  //Sebha(),
                  SecondSebha(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
