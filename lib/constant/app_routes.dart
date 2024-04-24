import 'package:chat_gpt/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is a class that defines the route constants for the application.

class Routes {
  static const String splash = '/splash';
  Routes._();
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
  ];
}

Widget Function(BuildContext) routeGenerator = (BuildContext context) {
  switch (ModalRoute.of(context)?.settings.name) {
    case Routes.splash:
      return const SplashScreen();

    default:
      return const SplashScreen();
  }
};
