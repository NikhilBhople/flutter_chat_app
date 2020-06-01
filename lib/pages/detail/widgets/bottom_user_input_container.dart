import 'package:flutter/material.dart';

class BottomUserInputContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
