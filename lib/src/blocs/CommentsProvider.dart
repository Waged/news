import 'package:flutter/material.dart';
import '../blocs/CommentsBloc.dart';
export '../blocs/CommentsBloc.dart';


class CommentsProvider extends InheritedWidget{
  final CommentsBloc bloc ;


  CommentsProvider({Key key, Widget child}):
      bloc = CommentsBloc(),
      super(key: key,child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }


  static CommentsBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(CommentsProvider) as CommentsProvider).bloc;
  }



}