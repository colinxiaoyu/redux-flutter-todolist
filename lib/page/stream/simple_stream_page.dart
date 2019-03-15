import 'package:flutter/material.dart';
import 'dart:async';

class SimpleStreamPage extends StatelessWidget {

  StreamController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleStreamPage'),
      ),
      body: Center(
        child: Text('stream text'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
