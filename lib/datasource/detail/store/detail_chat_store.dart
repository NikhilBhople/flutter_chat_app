import 'package:chatapp/domain/message_model.dart';
import 'package:chatapp/domain/user_model.dart';
import 'package:chatapp/service/chat_repository.dart';
import 'package:flutter/material.dart';

class UserChatStore {
  final ChatRepository repository;

  UserChatStore({@required this.repository});

  List<Message> _chatList;
  get chatList => _chatList;

  void getUserChatForDetailPage(User user) async {
    _chatList = await repository.getUserChatForDetailPage(user);
  }
}