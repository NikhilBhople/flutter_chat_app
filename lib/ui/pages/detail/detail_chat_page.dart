import 'package:chatapp/datasource/detail/store/detail_chat_store.dart';
import 'package:chatapp/domain/message_model.dart';
import 'package:chatapp/domain/user_model.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'render_user_chats.dart';
import 'widgets/bottom_user_input_container.dart';
import 'widgets/sender_chat_item.dart';
import 'widgets/user_chat_item.dart';
import 'widgets/waiting_container.dart';

class DetailChatPage extends StatefulWidget {
  final User user;
  DetailChatPage(this.user);

  @override
  _DetailChatPageState createState() => _DetailChatPageState(user);
}

class _DetailChatPageState extends State<DetailChatPage> {
  final User user;
  _DetailChatPageState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(user.imageUrl)),
            SizedBox(width: 20),
            Text(user.name),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              onPressed: null),
        ],
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(top: 30, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: Colors.white),
        child: GestureDetector(
          onTap: () => FocusScope.of(context)
              .unfocus(), // it will hide the keyboard when user click
          child: Column(
            children: <Widget>[
              Expanded(
                  child: StateBuilder<UserChatStore>(
                initState: (_, store) =>
                    store.setState((s) => s.getUserChatForDetailPage(user)),
                observe: () => RM.get<UserChatStore>(),
                builder: (context, store) {
                  return store.whenConnectionState(
                      onIdle: () => WaitingContainer(),
                      onWaiting: () => WaitingContainer(),
                      onData: (data) => RenderUserChatHistory(data.chatList),
                      onError: (error) => Center(
                          child: Text(
                              'Something went wrong. Please try again latter')));
                },
              )),
              BottomUserInputContainer()
            ],
          ),
        ),
      ),
    );
  }

  buildChatItem(int position) {
    return messages[position].sender == currentUser
        ? UserChatItem(position: position)
        : SenderChatItem(position: position);
  }
}
