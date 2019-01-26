import 'package:flutter/material.dart';
import '../blocs/StoriesProvider.dart';
import '../widgets/NewsListTile.dart';


class NewsList extends StatelessWidget {

  @override
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    //this is bad as now build will be called over and over
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return  Center(
            child: CircularProgressIndicator() ,
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int  index)  {
             bloc.fetchItem(snapshot.data[index]);
            return  NewsListTile(itemId: snapshot.data[index]);
          },
        );
      },
    );
  }
}