// ignore_for_file: deprecated_member_use

import 'package:chat_gpt/view/components/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      //   resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              Transform.rotate(
                                  angle: 3.14,
                                  child: SvgPicture.asset(
                                    'assets/icons/arrow_icon.svg',
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              SizedBox(width: screenWidth * .032),
                              Text('Back',
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/chat_gpt_icon.svg',
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView(
                children: [],
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomFormFiled(),
            ),
          ],
        ),
      ),
    );
  }
}
