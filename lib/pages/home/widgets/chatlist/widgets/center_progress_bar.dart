import 'package:flutter/material.dart';

class ShowProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
            backgroundColor: Theme.of(context).primaryColor),
      ),
    );
  }
}
