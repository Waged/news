import 'package:flutter/material.dart';
import '../models/ItemModel.dart';
import '../blocs/StoriesProvider.dart';
import '../widgets/LoadinContainer.dart';

class NewsListTile extends StatelessWidget {
  final int itemId;

  NewsListTile({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }
            return buildTile(context, itemSnapshot.data);
          },
        );
      },
    );
  }

  Widget buildTile(BuildContext context, ItemModel itemModel) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: (){
//            print('${itemModel.id} was tapped! ');
          Navigator.pushNamed(context,'/${itemModel.id}');
          },
          title: Text(itemModel.title),
          subtitle: Text('${itemModel.score} votes'),
          trailing: Column(
            children: <Widget>[
              Icon(Icons.comment),
              Text('${itemModel.descendants}')
            ],
          ),
        ),
        Divider(
          height: 4.0,
        ),
      ],
    );
  }
}
