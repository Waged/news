import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
final int itemId;


NewsDetail({this.itemId});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Detail'),
      ),
      body: Text('Im a detail screen with id ${itemId}'),
    );
  }

}
