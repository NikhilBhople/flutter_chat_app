import 'package:chatapp/domain/message_model.dart';
import 'package:chatapp/domain/user_model.dart';

class ChatRepository {

  Future<List<User>> getFavoriteContact() async {
    await Future.delayed(Duration(seconds: 2)); // In real app you can make the API call here by using http.client
    return favorites;
  }

  Future<List<Message>> getUserChatForDetailPage(User user) async {
    await Future.delayed(Duration(seconds: 2));
    return messages;
  }

  Future<List<Message>> getChatHistoryOfCategory(String category) async {
    // depending on category you can fetch the data from API
    await Future.delayed(Duration(seconds: 2));
    var list = chats;
    list.shuffle();
    return list;
  }

  List<String> getChatCategoryList() {
    return ['Messages', 'Online', 'Groups', 'Requests'];
  }
}
