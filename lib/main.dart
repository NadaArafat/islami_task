import 'package:flutter/material.dart';
import 'package:islami_onboarding_task/views/onboarding_view.dart';
import 'package:islami_onboarding_task/views/sebha_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SebhaView(),
    );
  }
}
