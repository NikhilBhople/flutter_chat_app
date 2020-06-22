import 'package:chatapp/domain/user_model.dart';
import 'package:chatapp/service/chat_repository.dart';
import 'package:flutter/material.dart';

class FavoriteUserStore {
  final ChatRepository repository;

  FavoriteUserStore({@required this.repository});

  List<User> _userList;
  get userList => _userList;

  void getFavoriteUserList() async {
    _userList = await repository.getFavoriteContact();
  }
}