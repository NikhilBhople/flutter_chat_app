import 'package:chatapp/datasource/home/store/chat_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'widgets/center_progress_bar.dart';
import 'widgets/render_chat_list.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder<ChatStore>(
      initState: (context, reactiveModel) => reactiveModel.setState((s) => s.getChatHistoryOfCategory('Messages')),
      observe:() => RM.get<ChatStore>(),
      builder: (context, reactiveModel) {
        return reactiveModel.whenConnectionState(
            onIdle: () => ShowProgress(),
            onWaiting: () => ShowProgress(),
            onData: (data) => RenderChatList(data.chatList),
            onError: (_) => Center(child: Text('Something went wrong. Please try again')));
      },
    );
  }
}
