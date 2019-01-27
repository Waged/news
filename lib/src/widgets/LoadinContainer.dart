import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: buildBox(),
          subtitle:  buildBox2(),
        )
      ],
    );
  }

  Widget buildBox() {
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
    );
  }

  Widget buildBox2() {
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 30.0,
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
    );
  }

}
