import 'package:flutter/material.dart';


class PullOnLoading extends StatefulWidget{
  @override
  _PullOnLoadingState createState() {
    return _PullOnLoadingState();
  }
  
}

class _PullOnLoadingState extends State<PullOnLoading>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PullOnLoading'),
      ),
    );
  }
  
}