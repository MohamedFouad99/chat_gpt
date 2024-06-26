// ignore_for_file: deprecated_member_use

import 'package:chat_gpt/constant/app_routes.dart';
import 'package:chat_gpt/constant/my_theme.dart';
import 'package:chat_gpt/constant/restart_widget.dart';
import 'package:chat_gpt/controller/theme_controller.dart';
import 'package:chat_gpt/view/components/home_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// This is the home screen of the application.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34, right: 18, left: 18),
              child: Column(
                children: [
                  HomeRowWidget(
                    icon: 'assets/icons/chat_bold_icon.svg',
                    text: 'New Chat',
                    onTap: () {
                      Get.toNamed(Routes.chat);
                    },
                    hasAnotherRow: true,
                    isUpgrade: false,
                    hasOptions: false,
                    hasDivider: true,
                  ),
                  SizedBox(
                    height: screenHeight * .48,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return HomeRowWidget(
                          icon: 'assets/icons/chat_icon.svg',
                          text: 'history $index',
                          onTap: () {},
                          onOptionTap: () {},
                          hasAnotherRow: true,
                          isUpgrade: false,
                          hasOptions: true,
                          hasDivider: true,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  HomeRowWidget(
                    icon: 'assets/icons/delete_icon.svg',
                    text: 'Clear conversations',
                    onTap: () {},
                    onOptionTap: () {},
                    hasAnotherRow: false,
                    isUpgrade: false,
                    hasOptions: false,
                    hasDivider: false,
                  ),
                  SizedBox(height: screenHeight * .015),
                  HomeRowWidget(
                    icon: 'assets/icons/person_icon.svg',
                    text: 'Upgrade to Plus',
                    onTap: () {},
                    onOptionTap: () {},
                    hasAnotherRow: false,
                    isUpgrade: true,
                    hasOptions: false,
                    hasDivider: false,
                  ),
                  SizedBox(height: screenHeight * .015),
                  HomeRowWidget(
                    icon: 'assets/icons/sun_icon.svg',
                    text: themeController.currentTheme.value ==
                            MyThemeData.lightTheme
                        ? 'Dark mode'
                        : 'Light mode',
                    onTap: () {
                      themeController.toggleTheme();
                      RestartWidget.restartApp(context);
                    },
                    onOptionTap: () {},
                    hasAnotherRow: false,
                    isUpgrade: false,
                    hasOptions: false,
                    hasDivider: false,
                  ),
                  SizedBox(height: screenHeight * .015),
                  HomeRowWidget(
                    icon: 'assets/icons/update_icon.svg',
                    text: 'Updates & FAQ',
                    onTap: () {},
                    onOptionTap: () {},
                    hasAnotherRow: false,
                    isUpgrade: false,
                    hasOptions: false,
                    hasDivider: false,
                  ),
                  SizedBox(height: screenHeight * .015),
                  HomeRowWidget(
                    icon: 'assets/icons/logout_icon.svg',
                    text: 'Logout',
                    onTap: () {},
                    onOptionTap: () {},
                    hasAnotherRow: false,
                    isUpgrade: false,
                    hasOptions: false,
                    hasDivider: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
