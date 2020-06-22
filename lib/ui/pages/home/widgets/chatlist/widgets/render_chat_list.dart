import 'package:chatapp/domain/message_model.dart';
import 'package:chatapp/ui/pages/detail/utils/list_view_animation.dart';
import 'package:flutter/material.dart';

import 'chat_item.dart';

class RenderChatList extends StatelessWidget {
  final List<Message> chatList;
  RenderChatList(this.chatList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: ListView.builder(
            padding: EdgeInsets.only(right: 16, top: 30, bottom: 10),
            itemCount: chatList.length,
            itemBuilder: (BuildContext context, int position) {
              return WidgetANimator(ChatItem(position: position));
            }),
      ),
    );
  }
}
