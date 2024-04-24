// ignore_for_file: deprecated_member_use

import 'package:chat_gpt/view/components/onboarding_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// By:MohamedFouad
// Date:24/April/2023
// Last Modified:24/April/2023
// Description:This is the onboarding widget of the application.
class OnboardingWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String secondDescription;
  final String thirdDescription;

  const OnboardingWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.secondDescription,
    required this.thirdDescription,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/chat_gpt_icon.svg',
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: .04 * MediaQuery.of(context).size.height),
              Text(
                'Welcome to\n ChatGPT',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(height: 1.2),
              ),
              SizedBox(height: .04 * MediaQuery.of(context).size.height),
              Text('Ask anything, get yout answer',
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: .06 * MediaQuery.of(context).size.height),
              Column(
                children: [
                  SvgPicture.asset(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: .015 * MediaQuery.of(context).size.height),
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 20)),
                ],
              ),
              SizedBox(height: .04 * MediaQuery.of(context).size.height),
              OnboardingCardWidget(description: description),
              OnboardingCardWidget(description: secondDescription),
              OnboardingCardWidget(description: thirdDescription),
            ]),
      ),
    );
  }
}
