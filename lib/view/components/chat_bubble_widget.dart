// ignore_for_file: deprecated_member_use

import 'package:chat_gpt/constant/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the chat bubble widget of the application this is a class that extends StatelessWidget.
// and it is responsible for displaying the chat bubble.
// The class takes in two parameters, message and messageIndex.
// The message parameter is the message that is displayed in the chat bubble.
// The messageIndex parameter is the index of the message in the chat list.
class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget(
      {super.key, required this.message, required this.messageIndex});
  final String message;
  final int messageIndex;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          left: messageIndex == 0 ? screenWidth * .25 : 16,
          top: 12,
          right: messageIndex == 0 ? 16 : screenWidth * .25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: messageIndex == 0
                  ? MyThemeData.colorPrimary
                  : Colors.grey.withOpacity(.9),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomRight: messageIndex == 1
                      ? const Radius.circular(8)
                      : const Radius.circular(0),
                  bottomLeft: messageIndex == 0
                      ? const Radius.circular(8)
                      : const Radius.circular(0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: MyThemeData.colorWhite,
                    ),
              ),
            ),
          ),
          messageIndex == 1
              ? Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/like_icon.svg',
                          color: Colors.grey.withOpacity(.9)),
                      SizedBox(width: screenWidth * .04),
                      SvgPicture.asset('assets/icons/dislike_icon.svg',
                          color: Colors.grey.withOpacity(.9)),
                      SizedBox(width: screenWidth * .085),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/copy_icon.svg',
                            color: Colors.grey.withOpacity(.9),
                          ),
                          SizedBox(width: screenWidth * .02),
                          Text('Copy',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 14,
                                      color: Colors.grey.withOpacity(.9))),
                        ],
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
