// By:MohamedFouad
// Date:24/April/2024
// Last Modified:24/April/2024
// Description:This is the chat model of the application. It is a class that
// contains the message and the index of the chat.
class ChatModel {
  final String msg;
  final int chatIndex;

  ChatModel({required this.msg, required this.chatIndex});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
      );
}
