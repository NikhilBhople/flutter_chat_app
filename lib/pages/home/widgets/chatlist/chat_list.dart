import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/pages/detail/utils/list_view_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/chat_item.dart';

class ChatList extends StatelessWidget {
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
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int position) {
              return WidgetANimator(ChatItem(position: position));
            }),
      ),
    );
  }
}
