import 'package:chatapp/pages/home/widgets/category_selector.dart';
import 'package:chatapp/pages/home/widgets/favorite_contacts.dart';
import 'package:flutter/material.dart';

import 'widgets/chatlist/chat_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),
            onPressed: null),
        title: Text(
          "Chat App",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              onPressed: null)
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Theme.of(context).accentColor),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  ChatList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
