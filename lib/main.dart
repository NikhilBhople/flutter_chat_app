import 'package:chatapp/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chat Application",
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.yellow[100],
      ),
      home: HomePage(),
    );
  }
}
