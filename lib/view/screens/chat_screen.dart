// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:chat_gpt/constant/app_routes.dart';
import 'package:chat_gpt/controller/chats_controller.dart';
import 'package:chat_gpt/view/components/chat_bubble_widget.dart';
import 'package:chat_gpt/view/components/custom_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the chat screen of the application.
// It is a class that extends StatefulWidget and it is responsible for displaying the chat screen.
// The class takes in no parameters and it is responsible for displaying the chat screen.
// The build method returns a Scaffold widget that contains a ListView widget and a Column widget.
// The Column widget contains a CustomFormFiled widget and a Expanded widget.
// The CustomFormFiled widget takes in several parameters, including controller, onSaved, onChange,
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = false;
  late TextEditingController textEditingController;
  late ScrollController listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final chatController = Provider.of<ChatController>(context);
    return Scaffold(
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  // chatController.getChatList.length,
                  itemBuilder: (context, index) {
                    return ChatBubbleWidget(
                      // message: chatController.getChatList[index].msg,
                      // messageIndex: chatController.getChatList[index].chatIndex,
                      message: chatMessages[index]['msg'].toString(),
                      messageIndex: int.parse(
                          chatMessages[index]['chatIndex'].toString()),
                    );
                  },
                ),
              ),
            ),
            if (isTyping) ...[
              SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.primary,
                size: 18,
              ),
            ],
            Expanded(
              flex: 1,
              child: CustomFormFiled(
                controller: textEditingController,
                onPressedSend: () async {
                  await sendMessageFCT(chatController: chatController);
                },
                onFieldSubmitted: (value) async {
                  await sendMessageFCT(chatController: chatController);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEND() {
    listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT({required ChatController chatController}) async {
    if (isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "You can't send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        isTyping = true;

        chatController.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatController.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: "gpt-3.5-turbo");

      setState(() {});
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        // scrollListToEND();
        isTyping = false;
      });
    }
  }
}
