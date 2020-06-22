import 'package:chatapp/pages/home/home_page.dart';
import 'package:chatapp/repository/chat_repository.dart';
import 'package:chatapp/store/chat_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        //NOTE1 : The order doesn't matter.
        //NOTE2: // Register with interface.
        Inject<ChatRepository>(() => ChatRepository()),
        //NOTE3: AuthenticationService is will be available globally
        Inject(() => ChatStore(repository: Injector.get()))],
      builder: (_) {
        return MaterialApp(
          title: "Chat Application",
          theme: ThemeData(
            primaryColor: Colors.red,
            accentColor: Colors.yellow[100],
          ),
          home: HomePage(),
        );
      },
    );
  }
}
