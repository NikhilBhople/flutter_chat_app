import 'package:chatapp/domain/message_model.dart';
import 'package:flutter/material.dart';

import 'utils/list_view_animation.dart';
import 'widgets/sender_chat_item.dart';
import 'widgets/user_chat_item.dart';

class RenderUserChatHistory extends StatelessWidget {
  final List<Message> chatList;

  RenderUserChatHistory(this.chatList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse:
          true, // It will set the gravity bottom (will appear from bottom to top)
      itemBuilder: (BuildContext context, int position) {
        return WidgetANimator(buildChatItem(position));
      },
      itemCount: chatList.length,
    );
  }

  Widget buildChatItem(int position) {
    return chatList[position].sender == currentUser
        ? UserChatItem(position: position)
        : SenderChatItem(position: position);
  }
}
