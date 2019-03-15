import 'package:flutter/material.dart';
import 'dart:async';

class SimpleStreamPage extends StatelessWidget {
  StreamController _controller = StreamController();

  int count = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleStreamPage'),
      ),
      body: Center(
          child: StreamBuilder(
              initialData: count,
              stream: _controller.stream,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.sink.add(count++);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
