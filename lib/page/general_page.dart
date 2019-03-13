import 'package:flutter/material.dart';

class GeneralPage extends StatelessWidget{
  final String title;
  final Widget child;

  const GeneralPage({Key key, @required this.title,@required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: child,
    );
  }

}