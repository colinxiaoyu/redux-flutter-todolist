import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget{
  @override
  _BottomNavigationWidgetState createState() {
    return _BottomNavigationWidgetState();
  }

}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BottomNavigationWidget'),),
    );
  }

}