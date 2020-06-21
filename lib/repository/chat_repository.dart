import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/model/user_model.dart';

class ChatRepository {
  List<User> getFavoriteContact() {
    return favorites;
  }

  Future<List<Message>> getUserChatForDetailPage(User user) async {
    return messages;
  }

  Future<List<Message>> getChatHistoryOfCategory(String category) async {
    if (category == 'Messages') {
      return chats;
    }
    return messages.reversed;
  }
}
