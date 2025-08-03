import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_onboarding_task/generated/assets.dart';
import 'package:islami_onboarding_task/utils/app_styles.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {

  int sebhaItemsCount = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(Assets.imagesHeadOfSebha)),
        SizedBox(height: 16),
        _buildSebha(),
        sebhaItemsCount == 0
            ? _buildResetButton()
            : SizedBox(),
      ],
    );
  }

  Widget _buildSebha() {
    final screenWidth = MediaQuery.of(context).size.width;
    final double sebhaDiameter = screenWidth * 0.6;
    final double radius = sebhaDiameter / 2;
    final double imageSize = sebhaDiameter * 0.11;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (sebhaItemsCount > 0) {
            sebhaItemsCount--;
          }
        });
      },
      child: Center(
        child: SizedBox(
          width: sebhaDiameter + imageSize,
          height: sebhaDiameter + imageSize,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ..._buildSebhaCircle(radius, imageSize),
              _buildSebhaContent(),
            ],
          ),
        ),
      ),
    );
  }


  List<Widget> _buildSebhaCircle(double radius, double imageSize) {
    return List.generate(sebhaItemsCount, (index) {
      final double angle = (2 * pi / 30) * index - pi / 2;
      final double x = radius * cos(angle) + radius;
      final double y = radius * sin(angle) + radius;
      return Positioned(
        left: x,
        top: y,
        child: Image.asset(
          Assets.imagesSebhaBead,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
        ),
      );
    });
  }


  Widget _buildSebhaContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('سبحان الله', style: AppStyles.arBold36),
        SizedBox(height: 8),
        Text(sebhaItemsCount.toString(), style: AppStyles.arBold36),
      ],
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          sebhaItemsCount = 30;
        });
      },
      child: Text('Reset', style: AppStyles.bold24),
    );
  }
}
