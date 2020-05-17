import 'package:chatapp/model/message_model.dart';
import 'package:chatapp/pages/detail/detail_chat_page.dart';
import 'package:flutter/material.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Favorite contacts",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                IconButton(icon: Icon(Icons.more_horiz), onPressed:() {})
              ],
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int position) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailChatPage(favorites[position]))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(favorites[position].imageUrl),
                        ),
                        SizedBox(height: 5,),
                        Text(favorites[position].name, style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
              itemCount: favorites.length,
            ),
          )
        ],
      ),
    );
  }
}
