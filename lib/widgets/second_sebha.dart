import 'dart:math';

import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../utils/app_styles.dart';

class SecondSebha extends StatefulWidget {
  const SecondSebha({super.key});

  @override
  State<SecondSebha> createState() => _SecondSebhaState();
}

class _SecondSebhaState extends State<SecondSebha> {
  int currentZeckrCount = 0;
  final int maxZeckrCount = 32;
  int currentZeckr = 0; // سبحان الله 0 - الحمد لله 1 - الله اكبر 2
  double rotationAngel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32),
          Stack(
            alignment: Alignment.center,
            children: [_buildSebhaImage(), _buildSebhaContent()],
          ),
          SizedBox(height: 32),
          currentZeckr == 2 && currentZeckrCount == maxZeckrCount
              ? _buildResetButton()
              : SizedBox(),
        ],
      ),
    );
  }

  _buildSebhaImage() {
    return Transform.rotate(
        angle: rotationAngel,
        child: Image.asset(Assets.imagesSebha));
  }

  _buildSebhaContent() {
    return _buildZeckr(
      currentZeckr == 0
          ? 'سبحان الله'
          : currentZeckr == 1
          ? 'الحمد لله'
          : 'الله أكبر',
    );
  }

  _buildZeckr(String title) {
    return Positioned(
      top: 230,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (currentZeckr == 2 && currentZeckrCount == maxZeckrCount) {
              return;
            }
            if (currentZeckrCount == maxZeckrCount) {
              currentZeckr++;
              currentZeckrCount = 0;
            } else {
              currentZeckrCount++;
            }
          });
          rotationAngel+=(360/maxZeckrCount) * (pi/180);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppStyles.arBold36),
            SizedBox(height: 8),
            Text('$currentZeckrCount', style: AppStyles.arBold36),
          ],
        ),
      ),
    );
  }

  _buildResetButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentZeckrCount = 0;
          currentZeckr = 0;
        });
      },
      child: Text('Reset', style: AppStyles.bold24),
    );
  }
}
