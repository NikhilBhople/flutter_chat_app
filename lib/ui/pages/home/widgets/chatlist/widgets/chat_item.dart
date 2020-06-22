import 'package:chatapp/domain/message_model.dart';
import 'package:chatapp/ui/pages/detail/detail_chat_page.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final int position;

  const ChatItem({Key key, this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailChatPage(chats[position].sender))),
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 16, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30)),
          color: chats[position].unread
              ? Colors.red[100]
              : Colors.grey[100],
        ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage:
              AssetImage(chats[position].sender.imageUrl),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    chats[position].sender.name,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    chats[position].text,
                    style: TextStyle(
                        color: Colors.black87, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(chats[position].time),
                SizedBox(height: 10),
                chats[position].unread
                    ? Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: Text(
                      "NEW",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ))
                    : Text(""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
