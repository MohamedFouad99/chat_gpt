import 'package:flutter/material.dart';

// By:MohamedFouad
// Date:24/April/2023
// Last Modified:24/April/2023
// Description:This is the onboarding card widget of the application.
class OnboardingCardWidget extends StatelessWidget {
  const OnboardingCardWidget({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: .006 * MediaQuery.of(context).size.height),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Theme.of(context).colorScheme.onBackground,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12),
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500)))),
    );
  }
}
