import 'api_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/chat_model.dart';
// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the chat controller of the application. It is a class that extends ChangeNotifier
// and it is responsible for handling the chat list and sending messages to the API.

class ChatController with ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(await ApiService.sendMessageGPT(
        message: msg,
        modelId: chosenModelId,
      ));
    } else {
      chatList.addAll(await ApiService.sendMessage(
        message: msg,
        modelId: chosenModelId,
      ));
    }
    notifyListeners();
  }
}
