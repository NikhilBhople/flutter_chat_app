import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int _selectedCategory = 0;
  final List<String> list = ['Massages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int position) {
          return GestureDetector(
            onTap: () => setState(() { // setState is must to rebuild the UI on selection
              _selectedCategory = position;
            }),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Text(
                list[position],
                style: TextStyle(
                    color: _selectedCategory == position
                        ? Colors.white
                        : Colors.white60,
                    fontSize: 20,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
  }
}
