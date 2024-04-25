import '../view/screens/chat_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/onboarding_screen.dart';
import '../view/screens/splash_screen.dart';
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
  static const String chat = '/chat';

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
    ),
    GetPage(
      name: '/chat',
      page: () => const ChatScreen(),
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

    case Routes.chat:
      return const ChatScreen();

    default:
      return const SplashScreen();
  }
};
final chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
        "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },
];
