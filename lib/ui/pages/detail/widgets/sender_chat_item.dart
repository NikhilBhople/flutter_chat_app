import 'package:chatapp/domain/message_model.dart';
import 'package:flutter/material.dart';

import 'time_and_message_column.dart';

class SenderChatItem extends StatelessWidget {
  final int position;

  const SenderChatItem({Key key, this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            child: TimeAndMessageColumn(position: position),
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
}
