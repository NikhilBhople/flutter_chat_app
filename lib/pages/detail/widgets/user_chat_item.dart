import 'package:flutter/material.dart';

import 'time_and_message_column.dart';

class UserChatItem extends StatelessWidget {
  final int position;

  const UserChatItem({Key key, this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 16, top: 20, bottom: 20),
      margin: EdgeInsets.only(left: 100, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          color: Theme.of(context).accentColor),
      child: TimeAndMessageColumn(position: position),
    );
  }
}
