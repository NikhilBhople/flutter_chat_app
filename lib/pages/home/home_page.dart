import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu, color: Colors.white,size: 25,), onPressed: null),
        title: Text("Chat App", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,size: 25,), onPressed: null)
        ],
        elevation: 0.0,
      ),
    );
  }
}
