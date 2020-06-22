import 'package:chatapp/datasource/home/store/chat_store.dart';
import 'package:chatapp/service/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class CategorySelector extends StatelessWidget {
  // as list is constant we don't want to call it again and again inside build() method
  final List<String> _list = IN.get<ChatRepository>().getChatCategoryList();
  int _selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return StateBuilder<ChatStore>(
        observe: () => RM.get<ChatStore>(),
        builder: (context, store) {
          // we can access the methods of repository by using datasource.home.store.state
          return Container(
            height: 90,
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int position) {
                return GestureDetector(
                  onTap: () async {
                    // setState is must to rebuild the UI on selection
                    _selectedPosition = position;
                    store.setState(
                        (s) => s.getChatHistoryOfCategory(_list[position]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 30),
                    child: Text(
                      _list[position],
                      style: TextStyle(
                          color: _selectedPosition == position
                              ? Colors.white
                              : Colors.white60,
                          fontSize: 20,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
              itemCount: _list.length,
            ),
          );
        });
  }
}
