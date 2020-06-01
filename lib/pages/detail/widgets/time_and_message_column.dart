import 'package:chatapp/model/message_model.dart';
import 'package:flutter/material.dart';

class TimeAndMessageColumn extends StatelessWidget {
  final int position;

  const TimeAndMessageColumn({Key key, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
