import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/pages/detail/utils/list_view_animation.dart';
import 'package:chatapp/pages/detail/widgets/bottom_user_input_container.dart';
import 'package:chatapp/pages/detail/widgets/user_chat_item.dart';
import 'package:flutter/material.dart';

import 'widgets/sender_chat_item.dart';

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
          onTap: () => FocusScope.of(context).unfocus(), // it will hide the keyboard when user click
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  reverse: true, // It will set the gravity bottom (will appear from bottom to top)
                  itemBuilder: (BuildContext context, int position) {
                    return WidgetANimator(buildChatItem(position));
                  },
                  itemCount: messages.length,
                ),
              ),
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
