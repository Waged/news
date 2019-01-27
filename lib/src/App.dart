import 'package:flutter/material.dart';
import 'package:news/src/blocs/StoriesProvider.dart';
import 'screens/NewsList.dart';
import 'screens/NewsDetail.dart';

class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'News!',
        onGenerateRoute: routes,
      ),
    );
  }


  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
          builder: (context) {
            return NewsList();
          }
      );
    } else {
      return MaterialPageRoute
      (
          builder: (context){
            final int itemId = int.parse(settings.name.replaceFirst('/', ''));

        //extract itemId from ItemModel
        //great place to do initialization
        return NewsDetail(itemId:itemId);
      });
    }
  }

}