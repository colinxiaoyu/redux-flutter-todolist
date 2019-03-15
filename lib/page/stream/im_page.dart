import 'package:flutter/material.dart';
import 'dart:async';

class IMPage extends StatefulWidget{

  @override
  _IMPageState createState() {
    // TODO: implement createState
    return _IMPageState();
  }
}

class _IMPageState extends State<IMPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('IMPage'),),
      body: SafeArea(child: Text('IMPage')),
    );
  }

}