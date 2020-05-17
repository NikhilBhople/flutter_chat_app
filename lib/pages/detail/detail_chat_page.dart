import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/pages/detail/list_view_animation.dart';
import 'package:flutter/material.dart';

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
        padding: EdgeInsets.symmetric(vertical: 30),
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
              buildBottomInputContainer(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem(int position) {
    return messages[position].sender == currentUser
        ? getSelfChatItem(position)
        : getSenderChatItem(position);
  }

  Container getSelfChatItem(int position) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 16, top: 20, bottom: 20),
      margin: EdgeInsets.only(left: 100, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          color: Theme.of(context).accentColor),
      child: getTimeAndMessageColumn(position),
    );
  }

  Row getSenderChatItem(int position) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            margin: EdgeInsets.only(right: 15, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Colors.red[100]),
            child: getTimeAndMessageColumn(position),
          ),
        ),
        IconButton(
          icon: Icon(
              messages[position].isLiked
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: messages[position].isLiked ? Colors.red : Colors.grey),
          onPressed: null,
          padding: EdgeInsets.only(right: 20),
        )
      ],
    );
  }

  Column getTimeAndMessageColumn(int position) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(messages[position].time,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14)),
        SizedBox(height: 5),
        Text(messages[position].text,
            style: TextStyle(color: Colors.black87, fontSize: 14)),
      ],
    );
  }

  Container buildBottomInputContainer(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).accentColor),
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.photo,
                color: Colors.grey,
              ),
              onPressed: null),
          SizedBox(width: 5),
          Expanded(
              child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration.collapsed(
                // collapsed hides bottom line of edit text
                hintText: 'Send a message...'),
          )),
          SizedBox(width: 5),
          IconButton(
              icon: Icon(
                Icons.send,
              ),
              onPressed: null),
        ],
      ),
    );
  }
}
