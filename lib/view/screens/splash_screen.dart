// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter_svg/svg.dart';

// By:MohamedFouad
// Date:24/April/2023
// Last Modified:24/April/2023
// Description:This is the splash screen of the application
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      // Navigate to the next screen here
      // For example, you can use Navigator.pushReplacement() to navigate to your home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/splash_icon.svg',
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: .06 * screenHeight),
            Text('ChatGPT', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
