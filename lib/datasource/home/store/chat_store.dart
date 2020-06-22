import 'package:chatapp/domain/message_model.dart';
import 'package:chatapp/service/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatStore {
  final ChatRepository repository;

  ChatStore({@required this.repository});

  List<Message> _chatList;
  get chatList => _chatList;

  void getChatHistoryOfCategory(String category) async {
    _chatList = await repository.getChatHistoryOfCategory(category);
  }
}
// It will be reactive domain.model to observe data and show UI accordingly