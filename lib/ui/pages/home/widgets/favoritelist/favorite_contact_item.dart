import 'package:chatapp/datasource/home/store/favorite_user_store.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../chatlist/widgets/center_progress_bar.dart';
import 'render_favoriter_user_list.dart';

class FavoriteContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
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
          StateBuilder<FavoriteUserStore>(
              initState: (_, store) => store.setState((s) => s.getFavoriteUserList()),
            observe: () => RM.get<FavoriteUserStore>(),
            builder: (context, store) {
              return store.whenConnectionState(
                  onIdle: () => ShowProgress(),
                  onWaiting: () => ShowProgress(),
                  onData: (data) => RenderFavoriteUserList(userList: data.userList),
                  onError: (_) => Center(child: Text('Something went wrong. Please try again')));
            }
          )
        ],
      ),
    );
  }
}
