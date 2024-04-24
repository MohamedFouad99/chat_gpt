// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:chat_gpt/constant/app_routes.dart';
import 'package:chat_gpt/constant/my_theme.dart';
import 'package:chat_gpt/view/components/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// By:MohamedFouad
// Date:24/April/2023
// Last Modified:24/April/2023
// Description:This is the onboarding screen of the application.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
// description : List of pages of onboarding card widget to be displayed.
  final List<Widget> _pages = [
    const OnboardingWidget(
      icon: 'assets/icons/onboarding1_icon.svg',
      title: 'Examples',
      description: 'Explain quantum computing in simple terms',
      secondDescription: 'Got any creative ideas for a 10 year old’s birthday?',
      thirdDescription: 'How do I make an HTTP request in Javascript?',
    ),
    const OnboardingWidget(
      icon: 'assets/icons/onboarding2_icon.svg',
      title: 'Capabilities',
      description: 'Remembers what user said earlier in the conversation',
      secondDescription: 'Allows user to provide follow-up corrections',
      thirdDescription: 'Trained to decline inappropriate requests',
    ),
    const OnboardingWidget(
      icon: 'assets/icons/onboarding3_icon.svg',
      title: 'Limitations',
      description: 'May occasionally generate incorrect information',
      secondDescription:
          'May occasionally produce harmful instructions or biased content',
      thirdDescription: 'Limited knowledge of world and events after 2021',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    //description : Build the onboarding screen.
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: 18.0, left: 18.0, right: 18.0, top: 12.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, .06 * screenHeight),
              backgroundColor: MyThemeData.colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          onPressed: () {
            if (_currentPage != _pages.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            } else {
              Navigator.pushReplacementNamed(context, Routes.home);
            }
          },
          child: _currentPage != _pages.length - 1
              ? Text('Next', style: Theme.of(context).textTheme.titleSmall)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Let’s Chat',
                        style: Theme.of(context).textTheme.titleSmall),
                    SizedBox(width: screenWidth * .015),
                    SvgPicture.asset('assets/icons/arrow_right.svg'),
                  ],
                ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/onboarding_icon.svg',
              color: _currentPage == 0 ? MyThemeData.colorPrimary : Colors.grey,
            ),
            SizedBox(width: screenWidth * .032),
            SvgPicture.asset(
              'assets/icons/onboarding_icon.svg',
              color: _currentPage == 1 ? MyThemeData.colorPrimary : Colors.grey,
            ),
            SizedBox(width: screenWidth * .032),
            SvgPicture.asset(
              'assets/icons/onboarding_icon.svg',
              color: _currentPage == 2 ? MyThemeData.colorPrimary : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
