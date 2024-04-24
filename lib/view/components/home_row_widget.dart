// ignore_for_file: deprecated_member_use

import 'package:chat_gpt/constant/my_theme.dart';
import 'package:chat_gpt/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the home row widget of the application.
class HomeRowWidget extends StatelessWidget {
  const HomeRowWidget({
    super.key,
    required this.onTap,
    this.onDeleteTap,
    required this.icon,
    required this.text,
    required this.hasAnotherRow,
    required this.isUpgrade,
    required this.hasOptions,
    required this.hasDivider,
  });
  final void Function() onTap;
  final void Function()? onDeleteTap;
  final String icon;
  final String text;
  final bool hasAnotherRow;
  final bool isUpgrade;
  final bool hasOptions;
  final bool hasDivider;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: screenHeight * .015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  SvgPicture.asset(
                    icon,
                    color: text != 'Logout'
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                  SizedBox(width: screenWidth * .032),
                  Text(text,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              text == 'Logout' ? const Color(0xFFED8C8C) : null,
                          fontWeight: text == 'New Chat'
                              ? FontWeight.w700
                              : FontWeight.w500))
                ],
              ),
            ),
            hasAnotherRow
                ? Row(
                    children: [
                      hasOptions
                          ? InkWell(
                              onTap: onDeleteTap,
                              child: SvgPicture.asset(
                                'assets/icons/delete_icon.svg',
                                color: MyThemeData.colorRed.withOpacity(.5),
                              ))
                          : const SizedBox(),
                      SizedBox(width: screenWidth * .08),
                      InkWell(
                          onTap: onTap,
                          child: SvgPicture.asset(
                            'assets/icons/arrow_icon.svg',
                            color: themeController.currentTheme.value ==
                                    MyThemeData.lightTheme
                                ? MyThemeData.colorPrimary
                                : null,
                          )),
                    ],
                  )
                : isUpgrade
                    ? Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBF3AD),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'New',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: MyThemeData.colorBlack,
                                    fontSize: 12),
                          ),
                        ),
                      )
                    : const SizedBox()
          ],
        ),
        SizedBox(height: screenHeight * .01),
        hasDivider
            ? const Divider(
                color: Colors.grey,
              )
            : const SizedBox(),
      ],
    );
  }
}
