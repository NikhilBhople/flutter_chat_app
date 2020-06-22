import 'package:chatapp/datasource/detail/store/detail_chat_store.dart';
import 'package:chatapp/service/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'datasource/home/store/chat_store.dart';
import 'datasource/home/store/favorite_user_store.dart';
import 'ui/pages/home/home_page.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        //NOTE1 : The order doesn't matter.
        //NOTE2: // Register with repository.
        Inject<ChatRepository>(() => ChatRepository()),
        //NOTE3: = Now Store will be available globally
        Inject(() => FavoriteUserStore(repository: Injector.get())),
        Inject(() => UserChatStore(repository: Injector.get())),
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
