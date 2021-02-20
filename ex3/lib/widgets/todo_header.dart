import 'package:flutter/material.dart';

class TodoHeader extends StatelessWidget {
  final String title;

  TodoHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          padding: EdgeInsets.only(left: 5, top: 15, bottom: 5),
          child: Text(title),
        ),
      ]),
    );
  }
}
