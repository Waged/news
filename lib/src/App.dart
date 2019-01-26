import 'package:flutter/material.dart';
import 'package:news/src/blocs/StoriesProvider.dart';
import 'screens/NewsList.dart';

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        home: NewsList(),
      ),
    );
  }



}
