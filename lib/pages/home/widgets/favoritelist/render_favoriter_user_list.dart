import 'package:chatapp/model/user_model.dart';
import 'package:chatapp/pages/detail/detail_chat_page.dart';
import 'package:flutter/material.dart';

class RenderFavoriteUserList extends StatelessWidget {
  final List<User> userList;

  const RenderFavoriteUserList({@required this.userList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int position) {
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailChatPage(userList[position]))),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(userList[position].imageUrl),
                  ),
                  SizedBox(height: 5,),
                  Text(userList[position].name, style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          );
        },
        itemCount: userList.length,
      ),
    );
  }
}
