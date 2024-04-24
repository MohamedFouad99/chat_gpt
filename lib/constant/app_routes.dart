import 'package:chat_gpt/view/screens/home_screen.dart';
import 'package:chat_gpt/view/screens/onboarding_screen.dart';
import 'package:chat_gpt/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is a class that defines the route constants for the application.

class Routes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';

  Routes._();
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    )
  ];
}

Widget Function(BuildContext) routeGenerator = (BuildContext context) {
  switch (ModalRoute.of(context)?.settings.name) {
    case Routes.splash:
      return const SplashScreen();

    case Routes.onboarding:
      return const OnboardingScreen();

    case Routes.home:
      return const HomeScreen();
    default:
      return const SplashScreen();
  }
};
